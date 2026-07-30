from kitty.fast_data_types import Screen
from kitty.tab_bar import (
    DrawData, 
    ExtraData, 
    TabBarData, 
    draw_title
)

# Number of spaces placed between tabs.
# Use 0 to place tabs directly beside each other.
TAB_SPACING = 1
ICON_PADDING_RIGHT = 1
ICON_PADDING_LEFT = 2

INACTIVE_ICON = "\ueabc"
ACTIVE_ICON = "\U000f0ec3"

def _draw_icon(screen: Screen, tab: TabBarData) -> int:
    """
    Draw the leading active/inactive icon.

    Returns the actual number of terminal cells occupied by the icon
    and the spacing after it.
    """

    icon = ACTIVE_ICON if tab.is_active else INACTIVE_ICON

    # Record the cursor's starting position so we can measure the
    # icon's actual rendered width
    # 
    # Some Nerd Font glyphs may occupy more than one terminal cell.
    start_x = screen.cursor.x

    if ICON_PADDING_LEFT > 0:
        screen.draw(" " * ICON_PADDING_LEFT)
    
    icon_start_x = screen.cursor.x

    # Draw the selected icon using the foreground color Kitty has
    # already assigned to this tab
    screen.draw(icon)
    
    # Clamp back to 1 cell, some Nerd Font glyphs render as 2 
    # cells wide even though they're visually a single glyph
    drawn_icon_width = screen.cursor.x - icon_start_x
    if drawn_icon_width > 1:
        screen.cursor.x = icon_start_x + 1

    # Add space between the icon and the title.
    if ICON_PADDING_RIGHT > 0:
        screen.draw(" " * ICON_PADDING_RIGHT)

    # Return the number of cells consumed.
    return screen.cursor.x - start_x

def _draw_title(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    index: int,
    max_width: int,
) -> int:
    """
    Draw and truncate the tab title.

    Returns the number of cells occupied by the rendered title.
    """
    # Nothing can be drawn if no horizontal space remains.
    if max_width <= 0:
        return 0

    start_x = screen.cursor.x

    # Use Kitty's built-in title renderer so tab_title_template,
    # active_tab_title_template, and formatting directives continue
    # to work
    draw_title(
        draw_data,
        screen,
        tab,
        index,
        max_width,
    )

    # Determine how many cells the title used
    rendered_width = screen.cursor.x - start_x

    # Kitty's title template can still produce text wider than the
    # available tab space, so truncate it manually when necessary
    if rendered_width > max_width:
        if max_width == 1:
            screen.cursor.x = start_x
        else:
            screen.cursor.x = start_x + max_width - 1

        screen.draw("…")

    return screen.cursor.x - start_x

def _draw_tab_spacing(screen: Screen, is_last: bool) -> int:
    """
    Draw spacing between adjacent tabs.

    No trailing space is added after the final tab.
    """

    if is_last or TAB_SPACING <= 0:
        return 0

    start_x = screen.cursor.x
    screen.draw(" " * TAB_SPACING)

    return screen.cursor.x - start_x

def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    """
    Public entry point called by Kitty for each tab

    Each tab is rendered in this order:
        icon → icon spacing → title → tab spacing
    """

    # Draw the active/inactive icon and determine its real width.
    icon_width = _draw_icon(screen, tab)

    # Reserve space between this tab and the next one.
    tab_spacing_width = 0 if is_last else TAB_SPACING

    # Everything that remains can be used by the title.
    available_title_width = max(
        0,
        max_title_length - icon_width - tab_spacing_width,
    )

    # Draw the title inside its available width.
    _draw_title(
        draw_data,
        screen,
        tab,
        index,
        available_title_width,
    )

    # Draw the gap before the next tab.
    _draw_tab_spacing(screen, is_last)

    # Kitty uses this position to determine where the tab ends.
    return screen.cursor.x

