@[Link("raylib_nuklear_shared")]
lib RayNuk
  VERSION = "0.1.0"

  NK_UNDEFINED                = (-1.0)
  NK_UTF_INVALID              = 0xFFFD
  NK_UTF_SIZE                 =      4
  NK_INPUT_MAX                =     16
  NK_MAX_NUMBER_BUFFER        =     64
  NK_SCROLLBAR_HIDING_TIMEOUT =    4.0

  alias NkInt8 = LibC::Char
  alias NkUInt8 = LibC::UChar
  alias NkInt16 = LibC::Short
  alias NkUInt16 = LibC::UShort
  alias NkInt32 = LibC::Int
  alias NkUInt32 = LibC::UInt
  alias NkSizeType = LibC::SizeT
  alias NkPointerType = LibC::ULong
  alias NkBool = Bool
  alias NkChar = NkInt8
  alias NkUChar = NkUInt8
  alias NkByte = NkUInt8
  alias NkShort = NkInt16
  alias NkUShort = NkUInt16
  alias NkInt = NkInt32
  alias NkUint = NkUInt32
  alias NkSize = NkSizeType
  alias NkPtr = NkPointerType
  alias NkHash = NkUint
  alias NkFlags = NkUint
  alias NkRune = NkUint

  # koło lini 475
  enum NkBoolEnum
    NkFalse
    NkTrue
  end

  struct NkColor
    r : NkByte
    g : NkByte
    b : NkByte
    a : NkByte
  end

  struct NkColorF
    r : LibC::Float
    g : LibC::Float
    b : LibC::Float
    a : LibC::Float
  end

  struct NkVec2
    x : LibC::Float
    y : LibC::Float
  end

  struct NkVec2I
    x : LibC::Short
    y : LibC::Short
  end

  struct NkRect
    x : LibC::Float
    y : LibC::Float
    w : LibC::Float
    h : LibC::Float
  end

  struct NkRectI
    x : LibC::Short
    y : LibC::Short
    w : LibC::Short
    h : LibC::Short
  end

  type NkGlyph = StaticArray(LibC::Char, NK_UTF_SIZE)

  union NkHandle
    ptr : Void*
    id : LibC::Int
  end

  struct NkImage
    handle : NkHandle
    w : NkUShort
    h : NkUShort
    region : StaticArray(NkUShort, 4)
  end

  struct NkNineSlice
    img : NkImage
    l : NkUShort
    t : NkUShort
    r : NkUShort
    b : NkUShort
  end

  struct NkCursor
    img : NkImage
    size : NkVec2
    offset : NkVec2
  end

  struct NkScroll
    x : NkUint
    y : NkUint
  end

  enum NkHeading
    NK_UP
    NK_RIGHT
    NK_DOWN
    NK_LEFT
  end

  enum NkButtonBehavior
    NK_BUTTON_DEFAULT
    NK_BUTTON_REPEATER
  end

  enum NkModify
    NK_FIXED      = NkBoolEnum::NkFalse
    NK_MODIFIABLE = NkBoolEnum::NkTrue
  end

  enum NkOrientation
    NK_VERTICAL
    NK_HORIZONTAL
  end

  enum NkCollapseStates
    NK_MINIMIZED = NkBoolEnum::NkFalse
    NK_MAXIMIZED = NkBoolEnum::NkTrue
  end

  enum NkShowStates
    NK_HIDDEN = NkBoolEnum::NkFalse
    NK_SHOWN  = NkBoolEnum::NkTrue
  end

  enum NkChartType
    NK_CHART_LINES
    NK_CHART_COLUMN
    NK_CHART_MAX
  end

  enum NkChartEvent
    NK_CHART_HOVERING = 0x01
    NK_CHART_CLICKED  = 0x02
  end

  enum NkColorFormat
    NK_RGB
    NK_RGBA
  end

  enum NkPopupType
    NK_POPUP_STATIC
    NK_POPUP_DYNAMIC
  end

  enum NkLayoutFormat
    NK_DYNAMIC
    NK_STATIC
  end

  enum NkTreeType
    NK_TREE_NODE
    NK_TREE_TAB
  end

  alias NkPluginAllocCallback = (NkHandle, Void*, NkSize -> Void*)
  alias NkPluginFreeCallback = (NkHandle, Void* -> Void)
  # 2 callbacks moved under text edit
  alias NkPluginCopyCallback = (NkHandle, LibC::Char* -> Void)

  struct NkAllocator
    userdata : NkHandle
    alloc : NkPluginAllocCallback
    free : NkPluginFreeCallback
  end

  enum NkSymbolType
    NK_SYMBOL_NONE
    NK_SYMBOL_X
    NK_SYMBOL_UNDERSCORE
    NK_SYMBOL_CIRCLE_SOLID
    NK_SYMBOL_CIRCLE_OUTLINE
    NK_SYMBOL_RECT_SOLID
    NK_SYMBOL_RECT_OUTLINE
    NK_SYMBOL_TRIANGLE_UP
    NK_SYMBOL_TRIANGLE_DOWN
    NK_SYMBOL_TRIANGLE_LEFT
    NK_SYMBOL_TRIANGLE_RIGHT
    NK_SYMBOL_PLUS
    NK_SYMBOL_MINUS
    NK_SYMBOL_TRIANGLE_UP_OUTLINE
    NK_SYMBOL_TRIANGLE_DOWN_OUTLINE
    NK_SYMBOL_TRIANGLE_LEFT_OUTLINE
    NK_SYMBOL_TRIANGLE_RIGHT_OUTLINE
    NK_SYMBOL_MAX
  end

  # Context - line 533
  fun nk_init_fixed(ctx : NkContext*, memory : Void*, size : NkSize, font : NkUserFont*) : NkBool
  fun nk_init(ctx : NkContext*, alloc : NkAllocator*, font : NkUserFont*) : NkBool
  fun nk_init_custom(ctx : NkContext*, cmds : NkBuffer*, pool : NkBuffer*, font : NkUserFont*) : NkBool
  fun nk_clear(ctx : NkContext*)
  fun nk_free(ctx : NkContext*)
  fun nk_set_user_data(ctx : NkContext*, handle : NkHandle)

  # Input - line 693
  enum NkKeys
    NK_KEY_NONE
    NK_KEY_SHIFT
    NK_KEY_CTRL
    NK_KEY_DEL
    NK_KEY_ENTER
    NK_KEY_TAB
    NK_KEY_BACKSPACE
    NK_KEY_COPY
    NK_KEY_CUT
    NK_KEY_PASTE
    NK_KEY_UP
    NK_KEY_DOWN
    NK_KEY_LEFT
    NK_KEY_RIGHT
    # Shortcuts: text field
    NK_KEY_TEXT_INSERT_MODE
    NK_KEY_TEXT_REPLACE_MODE
    NK_KEY_TEXT_RESET_MODE
    NK_KEY_TEXT_LINE_START
    NK_KEY_TEXT_LINE_END
    NK_KEY_TEXT_START
    NK_KEY_TEXT_END
    NK_KEY_TEXT_UNDO
    NK_KEY_TEXT_REDO
    NK_KEY_TEXT_SELECT_ALL
    NK_KEY_TEXT_WORD_LEFT
    NK_KEY_TEXT_WORD_RIGHT
    # Shortcuts: scrollbar
    NK_KEY_SCROLL_START
    NK_KEY_SCROLL_END
    NK_KEY_SCROLL_DOWN
    NK_KEY_SCROLL_UP
    NK_KEY_MAX
  end

  enum NkButtons
    NK_BUTTON_LEFT
    NK_BUTTON_MIDDLE
    NK_BUTTON_RIGHT
    NK_BUTTON_DOUBLE
    NK_BUTTON_MAX
  end

  fun nk_input_begin(ctx : NkContext*)
  fun nk_input_motion(ctx : NkContext*, x : LibC::Int, y : LibC::Int)
  fun nk_input_key(ctx : NkContext*, keys : NkKeys, down : NkBool)
  fun nk_input_button(ctx : NkContext*, buttons : NkButtons, x : LibC::Int, y : LibC::Int, down : NkBool)
  fun nk_input_scroll(ctx : NkContext*, val : NkVec2)
  fun nk_input_char(ctx : NkContext*, ch : LibC::Char)
  fun nk_input_glyph(ctx : NkContext*, glyph : NkGlyph)
  fun nk_input_unicode(ctx : NkContext*, rune : NkRune)
  fun nk_input_end(ctx : NkContext*)

  # Drawing - line 942

  enum NkAntiAliasing
    NK_ANTI_ALIASING_OFF
    NK_ANTI_ALIASING_ON
  end

  enum NkConvertResult
    NK_CONVERT_SUCCESS             = 0
    NK_CONVERT_INVALID_PARAM       = 1
    NK_CONVERT_COMMAND_BUFFER_FULL = 2
    NK_CONVERT_VERTEX_BUFFER_FULL  = 4
    NK_CONVERT_ELEMENT_BUFFER_FULL = 8
  end

  struct NkDrawNullTexture
    texture : NkHandle # texture handle to a texture with a white pixel
    uv : NkVec2        # coordinates to a white pixel in the texture
  end

  #  struct NkConvertConfig
  #    global_alpha : LibC::Float                 # global alpha value
  #    line_AA : NkAntiAliasing                   # line anti-aliasing flag can be turned off if you are tight on memory
  #    shape_AA : NkAntiAliasing                  # shape anti-aliasing flag can be turned off if you are tight on memory
  #    circle_segment_count : LibC::UInt          # number of segments used for circles: default to 22
  #    arc_segment_count : LibC::UInt             # number of segments used for arcs: default to 22
  #    curve_segment_count : LibC::UInt           # number of segments used for curves: default to 22
  #    tex_null : NkDrawNullTexture               # handle to texture with a white pixel for shape drawing
  #    vertex_layout : NkDrawVertexLayoutElement* # describes the vertex output format and packing
  #    vertex_size : NkSize                       # sizeof one vertex for vertex packing
  #    vertex_alignment : NkSize                  # vertex alignment: Can be obtained by NK_ALIGNOF
  #  end

  fun nk__begin(ctx : NkContext*) : NkCommand*
  fun nk__next(ctx : NkContext*, cmd : NkCommand*)

  # Window - line 1327
  @[Flags]
  enum NkPanelFlags
    NK_WINDOW_BORDER           =    1
    NK_WINDOW_MOVABLE          =    2
    NK_WINDOW_SCALABLE         =    4
    NK_WINDOW_CLOSABLE         =    8
    NK_WINDOW_MINIMIZABLE      =   16
    NK_WINDOW_NO_SCROLLBAR     =   32
    NK_WINDOW_TITLE            =   64
    NK_WINDOW_SCROLL_AUTO_HIDE =  128
    NK_WINDOW_BACKGROUND       =  256
    NK_WINDOW_SCALE_LEFT       =  512
    NK_WINDOW_NO_INPUT         = 1024
  end

  fun nk_begin? = nk_begin(ctx : NkContext*,
                           title : LibC::Char*,
                           bounds : NkRect,
                           flags : NkFlags) : NkBool
  fun nk_begin_titled? = nk_begin_titled(ctx : NkContext*,
                                         name : LibC::Char*,
                                         title : LibC::Char*,
                                         bounds : NkRect,
                                         flags : NkFlags) : NkBool
  fun nk_end(ctx : NkContext*)
  fun nk_window_find(ctx : NkContext*, name : LibC::Char*) : NkWindow
  fun nk_window_get_bounds(ctx : NkContext*) : NkRect
  fun nk_window_get_position(ctx : NkContext*) : NkVec2
  fun nk_window_get_size(ctx : NkContext*) : NkVec2
  fun nk_window_get_width(ctx : NkContext*) : LibC::Float
  fun nk_window_get_height(ctx : NkContext*) : LibC::Float
  fun nk_window_get_panel(ctx : NkContext*) : NkPanel*
  fun nk_window_get_content_region(ctx : NkContext*) : NkRect
  fun nk_window_get_content_region_min(ctx : NkContext*) : NkVec2
  fun nk_window_get_content_region_max(ctx : NkContext*) : NkVec2
  fun nk_window_get_content_region_size(ctx : NkContext*) : NkVec2
  fun nk_window_get_canvas(ctx : NkContext*) : NkCommandBuffer*
  fun nk_window_get_scroll(ctx : NkContext*, offset_x : NkUint*, offset_y : NkUint*) : Void
  fun nk_window_has_focus? = nk_window_has_focus(ctx : NkContext*) : NkBool
  fun nk_window_is_hovered? = nk_window_is_hovered(ctx : NkContext*) : NkBool
  fun nk_window_is_collapsed? = nk_window_is_collapsed(ctx : NkContext*, name : LibC::Char*) : NkBool
  fun nk_window_is_closed? = nk_window_is_closed(ctx : NkContext*, name : LibC::Char*) : NkBool
  fun nk_window_is_hidden? = nk_window_is_hidden(ctx : NkContext*, name : LibC::Char*) : NkBool
  fun nk_window_is_active? = nk_window_is_active(ctx : NkContext*, name : LibC::Char*) : NkBool
  fun nk_window_is_any_hovered? = nk_window_is_any_hovered(ctx : NkContext*) : NkBool
  fun nk_item_is_any_active? = nk_item_is_any_active(ctx : NkContext*) : NkBool
  fun nk_window_set_bounds(ctx : NkContext*, name : LibC::Char*, bounds : NkRect)
  fun nk_window_set_position(ctx : NkContext*, name : LibC::Char*, pos : NkVec2)
  fun nk_window_set_size(ctx : NkContext*, name : LibC::Char*, size : NkVec2)
  fun nk_window_set_focus(ctx : NkContext*, name : LibC::Char*)
  fun nk_window_set_scroll(ctx : NkContext*, offset_x : NkUint, offset_y : NkUint)
  fun nk_window_close(ctx : NkContext*, name : LibC::Char*)
  fun nk_window_collapse(ctx : NkContext*, name : LibC::Char*, state : NkCollapseStates)
  fun nk_window_collapse_if(ctx : NkContext*, name : LibC::Char*, state : NkCollapseStates, cond : LibC::Int)
  fun nk_window_show(ctx : NkContext*, name : LibC::Char*, state : NkShowStates)
  fun nk_window_show_if(ctx : NkContext*, name : LibC::Char*, state : NkShowStates, cond : LibC::Int)
  fun nk_rule_horizontal(ctx : NkContext*, color : NkColor, rounding : NkBool)

  # Layout - line 2048
  @[Flags]
  enum NkWidgetAlign
    NK_WIDGET_ALIGN_LEFT     = 0x01
    NK_WIDGET_ALIGN_CENTERED = 0x02
    NK_WIDGET_ALIGN_RIGHT    = 0x04
    NK_WIDGET_ALIGN_TOP      = 0x08
    NK_WIDGET_ALIGN_MIDDLE   = 0x10
    NK_WIDGET_ALIGN_BOTTOM   = 0x20
  end

  enum NkWidgetAlignment
    NK_WIDGET_LEFT     = NkWidgetAlign::NK_WIDGET_ALIGN_MIDDLE | NkWidgetAlign::NK_WIDGET_ALIGN_LEFT
    NK_WIDGET_CENTERED = NkWidgetAlign::NK_WIDGET_ALIGN_MIDDLE | NkWidgetAlign::NK_WIDGET_ALIGN_CENTERED
    NK_WIDGET_RIGHT    = NkWidgetAlign::NK_WIDGET_ALIGN_MIDDLE | NkWidgetAlign::NK_WIDGET_ALIGN_RIGHT
  end

  fun nk_layout_set_min_row_height(ctx : NkContext*, height : LibC::Float)
  fun nk_layout_reset_min_row_height(ctx : NkContext*)
  fun nk_layout_widget_bounds(ctx : NkContext*) : NkRect
  fun nk_layout_ratio_from_pixel(ctx : NkContext*, pixel_width : LibC::Float) : LibC::Float
  fun nk_layout_row_dynamic(ctx : NkContext*, height : LibC::Float, cols : LibC::Int)
  fun nk_layout_row_static(ctx : NkContext*, height : LibC::Float, item_width : LibC::Int, cols : LibC::Int)
  fun nk_layout_row_begin(ctx : NkContext*, fmt : NkLayoutFormat, row_height : LibC::Float, cols : LibC::Int)
  fun nk_layout_row_push(ctx : NkContext*, value : LibC::Float)
  fun nk_layout_row_end(ctx : NkContext*)
  fun nk_layout_row(ctx : NkContext*, fmt : NkLayoutFormat, height : LibC::Float, cols : LibC::Int, ratio : LibC::Float*)
  fun nk_layout_row_template_begin(ctx : NkContext*, row_height : LibC::Float)
  fun nk_layout_row_template_push_dynamic(ctx : NkContext*)
  fun nk_layout_row_template_push_variable(ctx : NkContext*, min_width : LibC::Float)
  fun nk_layout_row_template_push_static(ctx : NkContext*, width : LibC::Float)
  fun nk_layout_row_template_end(ctx : NkContext*)
  fun nk_layout_space_begin(ctx : NkContext*, fmt : NkLayoutFormat, height : LibC::Float, widget_count : LibC::Int)
  fun nk_layout_space_push(ctx : NkContext*, bounds : NkRect)
  fun nk_layout_space_end(ctx : NkContext*)
  fun nk_layout_space_bounds(ctx : NkContext*) : NkRect
  fun nk_layout_space_to_screen(ctx : NkContext*, vec : NkVec2) : NkVec2
  fun nk_layout_space_to_local(ctx : NkContext*, vec : NkVec2) : NkVec2
  fun nk_layout_space_rect_to_screen(ctx : NkContext*, bounds : NkRect) : NkRect
  fun nk_layout_space_rect_to_local(ctx : NkContext*, bounds : NkRect) : NkRect
  fun nk_spacer(ctx : NkContext*)

  # Group - line 2628
  fun nk_group_begin? = nk_group_begin(ctx : NkContext*,
                                       title : LibC::Char*,
                                       flags : NkFlags) : NkBool
  fun nk_group_begin_titled? = nk_group_begin_titled(ctx : NkContext*,
                                                     name : LibC::Char*,
                                                     title : LibC::Char*,
                                                     flags : NkFlags) : NkBool
  fun nk_group_end(ctx : NkContext*)
  fun nk_group_scrolled_offset_begin? = nk_group_scrolled_offset_begin(ctx : NkContext*,
                                                                       x_offset : NkUint*,
                                                                       y_offset : NkUint*,
                                                                       title : LibC::Char*,
                                                                       flags : NkFlags) : NkBool
  fun nk_group_scrolled_begin? = nk_group_scrolled_begin(ctx : NkContext*,
                                                         off : NkScroll*,
                                                         title : LibC::Char*,
                                                         flags : NkFlags) : NkBool
  fun nk_group_scrolled_end(ctx : NkContext*)
  fun nk_group_get_scroll(ctx : NkContext*, id : LibC::Char*, x_offset : NkUint*, y_offset : NkUint*)
  fun nk_group_set_scroll(ctx : NkContext*, id : LibC::Char*, x_offset : NkUint, y_offset : NkUint)

  # Tree - line 2832
  fun nk_tree_push_hashed? = nk_tree_push_hashed(ctx : NkContext*,
                                                 type : NkTreeType,
                                                 title : LibC::Char*,
                                                 initial_state : NkCollapseStates,
                                                 hash : LibC::Char*,
                                                 len : LibC::Int,
                                                 seed : LibC::Int) : NkBool
  fun nk_tree_image_push_hashed? = nk_tree_image_push_hashed(ctx : NkContext*,
                                                             type : NkTreeType,
                                                             img : NkImage,
                                                             title : LibC::Char*,
                                                             initial_state : NkCollapseStates,
                                                             hash : LibC::Char*,
                                                             len : LibC::Int,
                                                             seed : LibC::Int) : NkBool
  fun nk_tree_pop(ctx : NkContext*)
  fun nk_tree_state_push? = nk_tree_state_push(ctx : NkContext*,
                                               type : NkTreeType,
                                               title : LibC::Char*,
                                               state : NkCollapseStates*) : NkBool
  fun nk_tree_state_image_push? = nk_tree_state_image_push(ctx : NkContext*,
                                                           type : NkTreeType,
                                                           title : LibC::Char*,
                                                           image : NkImage,
                                                           state : NkCollapseStates*) : NkBool
  fun nk_tree_state_pop(ctx : NkContext*)
  fun nk_tree_element_push_hashed? = nk_tree_element_push_hashed(ctx : NkContext*,
                                                                 type : NkTreeType,
                                                                 title : LibC::Char*,
                                                                 initial_state : NkCollapseStates,
                                                                 selected : NkBool*,
                                                                 hash : LibC::Char*,
                                                                 len : LibC::Int,
                                                                 seed : LibC::Int) : NkBool
  fun nk_tree_element_image_push_hashed? = nk_tree_element_image_push_hashed(ctx : NkContext*,
                                                                             type : NkTreeType,
                                                                             image : NkImage,
                                                                             title : LibC::Char*,
                                                                             initial_state : NkCollapseStates,
                                                                             selected : NkBool*,
                                                                             hash : LibC::Char*,
                                                                             len : LibC::Int,
                                                                             seed : LibC::Int) : NkBool
  fun nl_tree_element_pop(ctx : NkContext*)

  # List View - line 3087
  struct NkListView
    begin_field : LibC::Int
    end_field : LibC::Int
    count : LibC::Int
    total_height : LibC::Int
    ctx : NkContext*
    scroll_pointer : NkUint*
    scroll_value : NkUint
  end

  fun nk_list_view_begin? = nk_list_view_begin(ctx : NkContext*,
                                               out_arg : NkListView*,
                                               id : LibC::Char*,
                                               flags : NkFlags,
                                               row_height : LibC::Int,
                                               row_count : LibC::Int) : NkBool
  fun nk_list_view_end(list : NkListView*)

  # Widget - line 3103

  @[Flags]
  enum NkWidgetLayoutStates
    NK_WIDGET_INVALID  # The widget cannot be seen and is completely out of view
    NK_WIDGET_VALID    # The widget is completely inside the window and can be updated and drawn
    NK_WIDGET_ROM      # The widget is partially visible and cannot be updated
    NK_WIDGET_DISABLED # The widget is manually disabled and acts like NK_WIDGET_ROM
  end

  enum NkWidgetStates
    NK_WIDGET_STATE_MODIFIED =  2
    NK_WIDGET_STATE_INACTIVE =  4                                                 # widget is neither active nor hovered
    NK_WIDGET_STATE_ENTERED  =  8                                                 # widget has been hovered on the current frame
    NK_WIDGET_STATE_HOVER    = 16                                                 # widget is being hovered
    NK_WIDGET_STATE_ACTIVED  = 32                                                 # widget is currently activated
    NK_WIDGET_STATE_LEFT     = 64                                                 # widget is from this frame on not hovered anymore
    NK_WIDGET_STATE_HOVERED  = NK_WIDGET_STATE_HOVER | NK_WIDGET_STATE_MODIFIED   # widget is being hovered
    NK_WIDGET_STATE_ACTIVE   = NK_WIDGET_STATE_ACTIVED | NK_WIDGET_STATE_MODIFIED # widget is currently activated
  end

  fun nk_widget(rect : NkRect*, ctx : NkContext*) : NkWidgetLayoutStates
  fun nk_widget_fitting(rect : NkRect*, ctx : NkContext*, vec : NkVec2) : NkWidgetLayoutStates
  fun nk_widget_bounds(ctx : NkContext*) : NkRect
  fun nk_widget_position(ctx : NkContext*) : NkVec2
  fun nk_widget_size(ctx : NkContext*) : NkVec2
  fun nk_widget_width(ctx : NkContext*) : LibC::Float
  fun nk_widget_height(ctx : NkContext*) : LibC::Float
  fun nk_widget_is_hovered? = nk_widget_is_hovered(ctx : NkContext*) : NkBool
  fun nk_widget_is_mouse_clicked? = nk_widget_is_mouse_clicked(ctx : NkContext*, buttons : NkButtons) : NkBool
  fun nk_widget_is_mouse_click_down? = nk_widget_is_mouse_click_down(ctx : NkContext*, buttons : NkButtons, down : NkBool) : NkBool
  fun nk_spacing(ctx : NkContext*, cols : LibC::Int)
  fun nk_widget_disable_begin(ctx : NkContext*)
  fun nk_widget_disable_end(ctx : NkContext*)

  # Text - line 3137
  enum NkTextAlign
    NK_TEXT_ALIGN_LEFT     = 0x01
    NK_TEXT_ALIGN_CENTERED = 0x02
    NK_TEXT_ALIGN_RIGHT    = 0x04
    NK_TEXT_ALIGN_TOP      = 0x08
    NK_TEXT_ALIGN_MIDDLE   = 0x10
    NK_TEXT_ALIGN_BOTTOM   = 0x20
  end

  enum NkTextAlignment
    NK_TEXT_LEFT     = NkTextAlign::NK_TEXT_ALIGN_MIDDLE | NkTextAlign::NK_TEXT_ALIGN_LEFT
    NK_TEXT_CENTERED = NkTextAlign::NK_TEXT_ALIGN_MIDDLE | NkTextAlign::NK_TEXT_ALIGN_CENTERED
    NK_TEXT_RIGHT    = NkTextAlign::NK_TEXT_ALIGN_MIDDLE | NkTextAlign::NK_TEXT_ALIGN_RIGHT
  end

  fun nk_text(ctx : NkContext*, str : LibC::Char*, len : LibC::Int, alignment : NkFlags)
  fun nk_text_colored(ctx : NkContext*, str : LibC::Char*, len : LibC::Int, alignment : NkFlags, color : NkColor)
  fun nk_text_wrap(ctx : NkContext*, text : LibC::Char*, len : LibC::Int)
  fun nk_text_wrap_colored(ctx : NkContext*, text : LibC::Char*, len : LibC::Int, color : NkColor)
  fun nk_label(ctx : NkContext*, text : LibC::Char*, alignment : NkFlags)
  fun nk_label_colored(ctx : NkContext*, text : LibC::Char*, alignment : NkFlags, color : NkColor)
  fun nk_label_wrap(ctx : NkContext*, text : LibC::Char*)
  fun nk_label_colored_wrap(ctx : NkContext*, text : LibC::Char*, color : NkColor)
  fun nk_image(ctx : NkContext*, image : NkImage)
  fun nk_image_color(ctx : NkContext*, image : NkImage, color : NkColor)

  # Button - line 3182
  fun nk_button_text? = nk_button_text(ctx : NkContext*, title : LibC::Char*, len : LibC::Int) : NkBool
  fun nk_button_label? = nk_button_label(ctx : NkContext*, title : LibC::Char*) : NkBool
  fun nk_button_color? = nk_button_color(ctx : NkContext*, color : NkColor) : NkBool
  fun nk_button_symbol? = nk_button_symbol(ctx : NkContext*, symbol : NkSymbolType) : NkBool
  fun nk_button_image? = nk_button_image(ctx : NkContext*, img : NkImage) : NkBool
  fun nk_button_symbol_label? = nk_button_symbol_label(ctx : NkContext*, symbol : NkSymbolType,
                                                       text : LibC::Char*, alignment : NkFlags) : NkBool
  fun nk_button_symbol_text? = nk_button_symbol_text(ctx : NkContext*, symbol : NkSymbolType,
                                                     text : LibC::Char*, len : LibC::Int, alignment : NkFlags) : NkBool
  fun nk_button_image_label? = nk_button_image_label(ctx : NkContext*, image : NkImage,
                                                     text : LibC::Char*, text_alignment : NkFlags) : NkBool
  fun nk_button_image_text? = nk_button_image_text(ctx : NkContext*, image : NkImage,
                                                   text : LibC::Char*, len : LibC::Int, alignment : NkFlags) : NkBool
  fun nk_button_text_styled? = nk_button_text_styled(ctx : NkContext*, style : NkStyleButton*,
                                                     title : LibC::Char*, len : LibC::Int) : NkBool
  fun nk_button_label_styled? = nk_button_label_styled(ctx : NkContext*, style : NkStyleButton*,
                                                       title : LibC::Char*) : NkBool
  fun nk_button_symbol_styled? = nk_button_symbol_styled(ctx : NkContext*, style : NkStyleButton*,
                                                         symbol : NkSymbolType) : NkBool
  fun nk_button_image_styled? = nk_button_image_styled(ctx : NkContext*, style : NkStyleButton*,
                                                       img : NkImage) : NkBool
  fun nk_button_symbol_text_styled? = nk_button_symbol_text_styled(ctx : NkContext*, style : NkStyleButton*,
                                                                   symbol : NkSymbolType, title : LibC::Char*,
                                                                   len : LibC::Int, alignment : NkFlags) : NkBool
  fun nk_button_symbol_label_styled? = nk_button_symbol_label_styled(ctx : NkContext*, style : NkStyleButton*,
                                                                     symbol : NkSymbolType, title : LibC::Char*,
                                                                     alignment : NkFlags) : NkBool
  fun nk_button_image_label_styled? = nk_button_image_label_styled(ctx : NkContext*, style : NkStyleButton*,
                                                                   img : NkImage, title : LibC::Char*,
                                                                   alignment : NkFlags) : NkBool
  fun nk_button_image_text_styled? = nk_button_image_text_styled(ctx : NkContext*, style : NkStyleButton*,
                                                                 img : NkImage, title : LibC::Char*, len : LibC::Int,
                                                                 alignment : NkFlags) : NkBool
  fun nk_button_set_behavior(ctx : NkContext*, behavior : NkButtonBehavior)
  fun nk_button_push_behavior? = nk_button_push_behavior(ctx : NkContext*, behavior : NkButtonBehavior) : NkBool
  fun nk_button_pop_behavior? = nk_button_pop_behavior(ctx : NkContext*) : NkBool

  # Checkbox - line 3207
  fun nk_check_label? = nk_check_label(ctx : NkContext*, label : LibC::Char*, active : NkBool) : NkBool
  fun nk_check_text? = nk_check_text(ctx : NkContext*, text : LibC::Char*, len : LibC::Int, active : NkBool) : NkBool
  fun nk_check_text_align? = nk_check_text_align(ctx : NkContext*, text : LibC::Char*, len : LibC::Int,
                                                 active : NkBool, widget_alignment : NkFlags, text_alignment : NkFlags) : NkBool
  fun nk_check_flags_label(ctx : NkContext*, label : LibC::Char*, flags : LibC::UInt, value : LibC::UInt) : LibC::UInt
  fun nk_check_flags_text(ctx : NkContext*, text : LibC::Char*, len : LibC::Int, flags : LibC::UInt,
                          value : LibC::UInt) : LibC::UInt
  fun nk_checkbox_label? = nk_checkbox_label(ctx : NkContext*, label : LibC::Char*, active : NkBool*) : NkBool
  fun nk_checkbox_label_align? = nk_checkbox_label_align(ctx : NkContext*, label : LibC::Char*,
                                                         active : NkBool*, widget_alignment : NkFlags,
                                                         text_alignment : NkFlags) : NkBool
  fun nk_checkbox_text? = nk_checkbox_text(ctx : NkContext*, text : LibC::Char*, len : LibC::Int, active : NkBool*) : NkBool
  fun nk_checkbox_text_align? = nk_checkbox_text_align(ctx : NkContext*, text : LibC::Char*, len : LibC::Int,
                                                       active : NkBool*, widget_alignment : NkFlags,
                                                       text_alignment : NkFlags) : NkBool
  fun nk_checkbox_flags_label? = nk_checkbox_flags_label(ctx : NkContext*, label : LibC::Char*, flags : LibC::UInt*,
                                                         value : LibC::UInt) : NkBool
  fun nk_checkbox_flags_text? = nk_checkbox_flags_text(ctx : NkContext*, text : LibC::Char*, len : LibC::Int,
                                                       flags : LibC::UInt*, value : LibC::UInt) : NkBool
  # Radio button - line 3223
  fun nk_radio_label? = nk_radio_label(ctx : NkContext*, label : LibC::Char*, active : NkBool*) : NkBool
  fun nk_radio_label_align? = nk_radio_label_align(ctx : NkContext*, label : LibC::Char*, active : NkBool*,
                                                   widget_alignment : NkFlags, text_alignment : NkFlags) : NkBool
  fun nk_radio_text? = nk_radio_text(ctx : NkContext*, text : LibC::Char*, len : LibC::Int, active : NkBool*) : NkBool
  fun nk_radio_text_align? = nk_radio_text_align(ctx : NkContext*, text : LibC::Char*, len : LibC::Int, active : NkBool*,
                                                 widget_alignment : NkFlags, text_alignment : NkFlags) : NkBool

  fun nk_option_label? = nk_option_label(ctx : NkContext*, label : LibC::Char*, active : NkBool) : NkBool
  fun nk_option_label_align? = nk_option_label_align(ctx : NkContext*, label : LibC::Char*, active : NkBool,
                                                     widget_alignment : NkFlags, text_alignment : NkFlags) : NkBool
  fun nk_option_text? = nk_option_text(ctx : NkContext*, text : LibC::Char*, len : LibC::Int, active : NkBool) : NkBool
  fun nk_option_text_align? = nk_option_text_align(ctx : NkContext*, text : LibC::Char*, len : LibC::Int, is_active : NkBool,
                                                   widget_alignment : NkFlags, text_alignment : NkFlags) : NkBool

  # Selectable - line 3236
  fun nk_selectable_label? = nk_selectable_label(ctx : NkContext*, label : LibC::Char*, align : NkFlags, value : NkBool*) : NkBool
  fun nk_selectable_text? = nk_selectable_text(ctx : NkContext*, text : LibC::Char*, len : LibC::Int,
                                               align : NkFlags, value : NkBool*) : NkBool
  fun nk_selectable_image_label? = nk_selectable_image_label(ctx : NkContext*, img : NkImage, label : LibC::Char*,
                                                             align : NkFlags, value : NkBool*) : NkBool
  fun nk_selectable_image_text? = nk_selectable_image_text(ctx : NkContext*, img : NkImage, text : LibC::Char*, len : LibC::Int,
                                                           align : NkFlags, value : NkBool*) : NkBool

  fun nk_select_label? = nk_select_label(ctx : NkContext*, label : LibC::Char*, align : NkFlags, value : NkBool) : NkBool
  fun nk_select_text? = nk_select_text(ctx : NkContext*, text : LibC::Char*, len : LibC::Int,
                                       align : NkFlags, value : NkBool) : NkBool
  fun nk_select_image_label? = nk_select_image_label(ctx : NkContext*, img : NkImage, label : LibC::Char*,
                                                     align : NkFlags, value : NkBool) : NkBool
  fun nk_select_image_text? = nk_select_image_text(ctx : NkContext*, img : NkImage, text : LibC::Char*, len : LibC::Int,
                                                   align : NkFlags, value : NkBool) : NkBool

  fun nk_select_symbol_label? = nk_select_symbol_label(ctx : NkContext*, symbol : NkSymbolType, label : LibC::Char*,
                                                       align : NkFlags, value : NkBool) : NkBool
  fun nk_select_symbol_text? = nk_select_symbol_text(ctx : NkContext*, symbol : NkSymbolType, text : LibC::Char*,
                                                     len : LibC::Int, align : NkFlags, value : NkBool) : NkBool

  # Slider - line 3255
  fun nk_slide_float(ctx : NkContext*, min : LibC::Float, val : LibC::Float,
                     max : LibC::Float, step : LibC::Float) : LibC::Float
  fun nk_slide_int(ctx : NkContext*, min : LibC::Int, val : LibC::Int,
                   max : LibC::Int, step : LibC::Int) : LibC::Int
  fun nk_slider_float? = nk_slider_float(ctx : NkContext*, min : LibC::Float, val : LibC::Float*,
                                         max : LibC::Float, step : LibC::Float) : NkBool
  fun nk_slider_int? = nk_slider_int(ctx : NkContext*, min : LibC::Int, val : LibC::Int*, max : LibC::Int, step : LibC::Int) : NkBool

  # Knob - line 3265
  fun nk_knob_float? = nk_knob_float(ctx : NkContext*, min : LibC::Float, val : LibC::Float*,
                                     max : LibC::Float, step : LibC::Float,
                                     zero_direction : NkHeading, dead_zone_degrees : LibC::Float) : NkBool
  fun nk_knob_int? = nk_knob_int(ctx : NkContext*, min : LibC::Int, val : LibC::Int*,
                                 max : LibC::Int, step : LibC::Int, zero_direction : NkHeading, dead_zone_degrees : LibC::Float) : NkBool

  # Progressbar - line 3273
  fun nk_progress? = nk_progress(ctx : NkContext*, cur : NkSize*, max : NkSize, modifyable : NkBool) : NkBool
  fun nk_prog(ctx : NkContext*, cur : NkSize, max : NkSize, modifyable : NkBool) : NkSize

  # Color Picker - line 3281
  fun nk_color_picker(ctx : NkContext*, color : NkColorF, fmt : NkColorFormat) : NkColorF
  fun nk_color_pick? = nk_color_pick(ctx : NkContext*, color : NkColorF*, fmt : NkColorFormat) : NkBool

  # Properties - line 3288
  fun nk_property_int(ctx : NkContext*, name : LibC::Char*, min : LibC::Int, val : LibC::Int*, max : LibC::Int, step : LibC::Int, inc_per_pixel : LibC::Float)
  fun nk_property_float(ctx : NkContext*, name : LibC::Char*, min : LibC::Float, val : LibC::Float*, max : LibC::Float, step : LibC::Float, inc_per_pixel : LibC::Float)
  fun nk_property_double(ctx : NkContext*, name : LibC::Char*, min : LibC::Double, val : LibC::Double*, max : LibC::Double, step : LibC::Double, inc_per_pixel : LibC::Float)
  fun nk_propertyi(ctx : NkContext*, name : LibC::Char*, min : LibC::Int, val : LibC::Int, max : LibC::Int, step : LibC::Int, inc_per_pixel : LibC::Float)
  fun nk_propertyf(ctx : NkContext*, name : LibC::Char*, min : LibC::Float, val : LibC::Float, max : LibC::Float, step : LibC::Float, inc_per_pixel : LibC::Float)
  fun nk_propertyd(ctx : NkContext*, name : LibC::Char*, min : LibC::Double, val : LibC::Double, max : LibC::Double, step : LibC::Double, inc_per_pixel : LibC::Float)

  # Text Edit - line 3496
  enum NkEditFlags
    NK_EDIT_DEFAULT              =    0
    NK_EDIT_READ_ONLY            =    1
    NK_EDIT_AUTO_SELECT          =    2
    NK_EDIT_SIG_ENTER            =    4
    NK_EDIT_ALLOW_TAB            =    8
    NK_EDIT_NO_CURSOR            =   16
    NK_EDIT_SELECTABLE           =   32
    NK_EDIT_CLIPBOARD            =   64
    NK_EDIT_CTRL_ENTER_NEWLINE   =  128
    NK_EDIT_NO_HORIZONTAL_SCROLL =  256
    NK_EDIT_ALWAYS_INSERT_MODE   =  512
    NK_EDIT_MULTILINE            = 1024
    NK_EDIT_GOTO_END_ON_ACTIVATE = 2048
  end

  enum NkEditTypes
    NK_EDIT_SIMPLE = NkEditFlags::NK_EDIT_ALWAYS_INSERT_MODE
    NK_EDIT_FIELD  = NK_EDIT_SIMPLE | NkEditFlags::NK_EDIT_SELECTABLE | NkEditFlags::NK_EDIT_CLIPBOARD
    NK_EDIT_BOX    = NkEditFlags::NK_EDIT_ALWAYS_INSERT_MODE | NkEditFlags::NK_EDIT_SELECTABLE | NkEditFlags::NK_EDIT_MULTILINE | NkEditFlags::NK_EDIT_ALLOW_TAB | NkEditFlags::NK_EDIT_CLIPBOARD
    NK_EDIT_EDITOR = NkEditFlags::NK_EDIT_SELECTABLE | NkEditFlags::NK_EDIT_MULTILINE | NkEditFlags::NK_EDIT_ALLOW_TAB | NkEditFlags::NK_EDIT_CLIPBOARD
  end

  enum NkEditEvents
    NK_EDIT_ACTIVE      =  1 #  edit widget is currently being modified
    NK_EDIT_INACTIVE    =  2 #  edit widget is not active and is not being modified
    NK_EDIT_ACTIVATED   =  4 #  edit widget went from state inactive to state active
    NK_EDIT_DEACTIVATED =  8 #  edit widget went from state active to state inactive
    NK_EDIT_COMMITED    = 16 #  edit widget has received an enter and lost focus
  end

  fun nk_edit_string(ctx : NkContext*, flags : NkFlags, buffer : LibC::Char*, len : LibC::Int*, max : LibC::Int, filter : NkPluginFilterCallback) : NkFlags
  fun nk_edit_string_zero_terminated(ctx : NkContext*, flags : NkFlags, buffer : LibC::Char*, max : LibC::Int, filter : NkPluginFilterCallback) : NkFlags
  fun nk_edit_buffer(ctx : NkContext*, flags : NkFlags, edit : NkTextEdit*, filter : NkPluginFilterCallback) : NkFlags
  fun nk_edit_focus(ctx : NkContext*, flags : NkFlags)
  fun nk_edit_unfocus(ctx : NkContext*)

  # Chart - line 3534
  fun nk_chart_begin? = nk_chart_begin(ctx : NkContext*, type : NkChartType, count : LibC::Int, min : LibC::Float, max : LibC::Float) : NkBool
  fun nk_chart_begin_colored? = nk_chart_begin_colored(ctx : NkContext*, type : NkChartType, color : NkColor, highlight : NkColor,
                                                       count : LibC::Int, min : LibC::Float, max : LibC::Float) : NkBool
  fun nk_chart_add_slot(ctx : NkContext*, type : NkChartType, count : LibC::Int, min : LibC::Float, max : LibC::Float)
  fun nk_chart_add_slot_colored(ctx : NkContext*, type : NkChartType, color : NkColor, highlight : NkColor,
                                count : LibC::Int, min : LibC::Float, max : LibC::Float) : NkBool
  fun nk_chart_push(ctx : NkContext*, value : LibC::Float) : NkFlags
  fun nk_chart_push_slot(ctx : NkContext*, value : LibC::Float, slot : LibC::Int) : NkFlags
  fun nk_chart_end(ctx : NkContext*)
  fun nk_plot(ctx : NkContext*, type : NkChartType, values : LibC::Float*, count : LibC::Int, offset : LibC::Int)
  # float(*value_getter)(void* user, int index)
  alias NkChartValueGetterCallback = (Void*, LibC::Int) -> LibC::Float
  fun nk_plot_function(ctx : NkContext*, type : NkChartType, userdata : Void*, value_getter : NkChartValueGetterCallback, count : LibC::Int, offset : LibC::Int)

  # Popup - line 3548
  fun nk_popup_begin? = nk_popup_begin(ctx : NkContext*, type : NkPopupType, title : LibC::Char*, flags : NkFlags, bounds : NkRect) : NkBool
  fun nk_popup_close(ctx : NkContext*)
  fun nk_popup_end(ctx : NkContext*)
  fun nk_popup_get_scroll(ctx : NkContext*, offset_x : NkUint*, offset_y : NkUint*)
  fun nk_popup_set_scroll(ctx : NkContext*, offset_x : NkUint, offset_y : NkUint)

  # Combobox - line 3558
  fun nk_combo(ctx : NkContext*, items : Pointer(LibC::Char*), count : LibC::Int, selected : LibC::Int,
               item_height : LibC::Int, size : NkVec2) : LibC::Int
  fun nk_combo_separator(ctx : NkContext*, items_separated_by_separator : LibC::Char*, separator : LibC::Int,
                         selected : LibC::Int, count : LibC::Int, item_height : LibC::Int, size : NkVec2) : LibC::Int
  fun nk_combo_string(ctx : NkContext*, items_separated_by_zeros : LibC::Char*, selected : LibC::Int,
                      count : LibC::Int, item_height : LibC::Int, size : NkVec2) : LibC::Int
  # void(*item_getter)(void*, int, const char**)
  alias NkComboboxItemGetterCallback = (Void*, LibC::Int, Pointer(LibC::Char*)) -> Void
  fun nk_combo_callback(ctx : NkContext*, item_getter : NkComboboxItemGetterCallback, userdata : Void*,
                        selected : LibC::Int, count : LibC::Int, item_height : LibC::Int, size : NkVec2) : LibC::Int

  fun nk_combobox(ctx : NkContext*, items : Pointer(LibC::Char*), count : LibC::Int, selected : LibC::Int*,
                  item_height : LibC::Int, size : NkVec2)
  fun nk_combobox_string(ctx : NkContext*, items_separated_by_zeros : LibC::Char*, selected : LibC::Int*,
                         count : LibC::Int, item_height : LibC::Int, size : NkVec2)
  fun nk_combobox_separator(ctx : NkContext*, items_separated_by_separator : LibC::Char*, separator : LibC::Int,
                            selected : LibC::Int*, count : LibC::Int, item_height : LibC::Int, size : NkVec2)
  fun nk_combobox_callback(ctx : NkContext*, item_getter : NkComboboxItemGetterCallback, userdata : Void*,
                           selected : LibC::Int*, count : LibC::Int, item_height : LibC::Int, size : NkVec2)

  # Abstract Combobox - line 3571
  fun nk_combo_begin_text? = nk_combo_begin_text(ctx : NkContext*, selected : LibC::Char*,
                                                 len : LibC::Int, size : NkVec2) : NkBool
  fun nk_combo_begin_label? = nk_combo_begin_label(ctx : NkContext*, selected : LibC::Char*,
                                                   size : NkVec2) : NkBool
  fun nk_combo_begin_color? = nk_combo_begin_color(ctx : NkContext*, color : NkColor, size : NkVec2) : NkBool
  fun nk_combo_begin_symbol? = nk_combo_begin_symbol(ctx : NkContext*, symbol_type : NkSymbolType,
                                                     size : NkVec2) : NkBool
  fun nk_combo_begin_symbol_label? = nk_combo_begin_symbol_label(ctx : NkContext*, selected : LibC::Char*,
                                                                 symbol_type : NkSymbolType, size : NkVec2) : NkBool
  fun nk_combo_begin_symbol_text? = nk_combo_begin_symbol_text(ctx : NkContext*, selected : LibC::Char*,
                                                               len : LibC::Int, symbol_type : NkSymbolType,
                                                               size : NkVec2) : NkBool
  fun nk_combo_begin_image? = nk_combo_begin_image(ctx : NkContext*, img : NkImage, size : NkVec2) : NkBool
  fun nk_combo_begin_image_label? = nk_combo_begin_image_label(ctx : NkContext*, selected : LibC::Char*,
                                                               image : NkImage, size : NkVec2) : NkBool
  fun nk_combo_begin_image_text? = nk_combo_begin_image_text(ctx : NkContext*, selected : LibC::Char*,
                                                             len : LibC::Int, img : NkImage, size : NkVec2) : NkBool
  fun nk_combo_item_label? = nk_combo_item_label(ctx : NkContext*, selected : LibC::Char*, alignment : NkFlags) : NkBool
  fun nk_combo_item_text? = nk_combo_item_text(ctx : NkContext*, selected : LibC::Char*,
                                               len : LibC::Int, alignment : NkFlags) : NkBool
  fun nk_combo_item_image_label? = nk_combo_item_image_label(ctx : NkContext*, img : NkImage,
                                                             selected : LibC::Char*, alignment : NkFlags) : NkBool
  fun nk_combo_item_image_text? = nk_combo_item_image_text(ctx : NkContext*, img : NkImage,
                                                           selected : LibC::Char*, len : LibC::Int,
                                                           alignment : NkFlags) : NkBool
  fun nk_combo_item_symbol_label? = nk_combo_item_symbol_label(ctx : NkContext*,
                                                               symbol_type : NkSymbolType, selected : LibC::Char*,
                                                               alignment : NkFlags) : NkBool
  fun nk_combo_item_symbol_text? = nk_combo_item_symbol_text(ctx : NkContext*,
                                                             symbol_type : NkSymbolType, selected : LibC::Char*,
                                                             len : LibC::Int, alignment : NkFlags) : NkBool
  fun nk_combo_close(ctx : NkContext*)
  fun nk_combo_end(ctx : NkContext*)

  # Contextual - line 3593
  fun nk_contextual_begin? = nk_contextual_begin(ctx : NkContext*, flags : NkFlags, size : NkVec2,
                                                 trigger_bounds : NkRect) : NkBool
  fun nk_contextual_item_text? = nk_contextual_item_text(ctx : NkContext*, text : LibC::Char*,
                                                         len : LibC::Int, align : NkFlags) : NkBool
  fun nk_contextual_item_label? = nk_contextual_item_label(ctx : NkContext*, label : LibC::Char*,
                                                           align : NkFlags) : NkBool

  fun nk_contextual_item_image_label? = nk_contextual_item_image_label(ctx : NkContext*, img : NkImage, label : LibC::Char*,
                                                                       align : NkFlags) : NkBool
  fun nk_contextual_item_image_text? = nk_contextual_item_image_text(ctx : NkContext*, img : NkImage, text : LibC::Char*,
                                                                     len : LibC::Int, align : NkFlags) : NkBool
  fun nk_contextual_item_symbol_label? = nk_contextual_item_symbol_label(ctx : NkContext*, symbol : NkSymbolType, label : LibC::Char*,
                                                                         align : NkFlags) : NkBool
  fun nk_contextual_item_symbol_text? = nk_contextual_item_symbol_text(ctx : NkContext*, symbol : NkSymbolType, text : LibC::Char*,
                                                                       len : LibC::Int, align : NkFlags) : NkBool
  fun nc_contextual_close(ctx : NkContext*)
  fun nc_contextual_end(ctx : NkContext*)

  # Tooltip - line 3607
  fun nk_tooltip(ctx : NkContext*, text : LibC::Char*)
  fun nk_tooltip_begin? = nk_tooltip_begin(ctx : NkContext*, width : LibC::Float) : NkBool
  fun nk_tooltip_end(ctx : NkContext*)

  # Menu - line 3619
  fun nk_menubar_begin(ctx : NkContext*)
  fun nk_menubar_end(ctx : NkContext*)
  fun nk_menu_begin_text? = nk_menu_begin_text(ctx : NkContext*, title : LibC::Char*, title_len : LibC::Int,
                                               align : NkFlags, size : NkVec2) : NkBool
  fun nk_menu_begin_label? = nk_menu_begin_label(ctx : NkContext*, text : LibC::Char*, align : NkFlags,
                                                 size : NkVec2) : NkBool
  fun nk_menu_begin_image? = nk_menu_begin_image(ctx : NkContext*, id : LibC::Char*, img : NkImage, size : NkVec2) : NkBool
  fun nk_menu_begin_image_text? = nk_menu_begin_image_text(ctx : NkContext*, title : LibC::Char*,
                                                           len : LibC::Int, align : NkFlags, img : NkImage,
                                                           size : NkVec2) : NkBool
  fun nk_menu_begin_image_label? = nk_menu_begin_image_label(ctx : NkContext*, title : LibC::Char*, align : NkFlags,
                                                             img : NkImage, size : NkVec2) : NkBool
  fun nk_menu_begin_symbol? = nk_menu_begin_symbol(ctx : NkContext*, id : LibC::Char*, symbol : NkSymbolType,
                                                   size : NkVec2) : NkBool
  fun nk_menu_begin_symbol_text? = nk_menu_begin_symbol_text(ctx : NkContext*, title : LibC::Char*,
                                                             len : LibC::Int, align : NkFlags, symbol : NkSymbolType,
                                                             size : NkVec2) : NkBool
  fun nk_menu_begin_symbol_label? = nk_menu_begin_symbol_label(ctx : NkContext*, title : LibC::Char*,
                                                               align : NkFlags, symbol : NkSymbolType, size : NkVec2) : NkBool
  fun nk_menu_item_text? = nk_menu_item_text(ctx : NkContext*, title : LibC::Char*, title_len : LibC::Int,
                                             align : NkFlags) : NkBool
  fun nk_menu_item_label? = nk_menu_item_label(ctx : NkContext*, text : LibC::Char*, align : NkFlags) : NkBool
  fun nk_menu_item_image_label? = nk_menu_item_image_label(ctx : NkContext*, img : NkImage, title : LibC::Char*,
                                                           align : NkFlags) : NkBool
  fun nk_menu_item_image_text? = nk_menu_item_image_text(ctx : NkContext*, img : NkImage, title : LibC::Char*,
                                                         len : LibC::Int, align : NkFlags) : NkBool
  fun nk_menu_item_symbol_label? = nk_menu_item_symbol_label(ctx : NkContext*, symbol : NkSymbolType,
                                                             title : LibC::Char*, align : NkFlags) : NkBool
  fun nk_menu_item_symbol_text? = nk_menu_item_symbol_text(ctx : NkContext*, symbol : NkSymbolType,
                                                           title : LibC::Char*, len : LibC::Int, align : NkFlags) : NkBool
  fun nk_menu_close(ctx : NkContext*)
  fun nk_menu_end(ctx : NkContext*)

  # Style - line 3642
  NK_WIDGET_DISABLED_FACTOR = 0.5

  enum NkStyleColors
    NK_COLOR_TEXT
    NK_COLOR_WINDOW
    NK_COLOR_HEADER
    NK_COLOR_BORDER
    NK_COLOR_BUTTON
    NK_COLOR_BUTTON_HOVER
    NK_COLOR_BUTTON_ACTIVE
    NK_COLOR_TOGGLE
    NK_COLOR_TOGGLE_HOVER
    NK_COLOR_TOGGLE_CURSOR
    NK_COLOR_SELECT
    NK_COLOR_SELECT_ACTIVE
    NK_COLOR_SLIDER
    NK_COLOR_SLIDER_CURSOR
    NK_COLOR_SLIDER_CURSOR_HOVER
    NK_COLOR_SLIDER_CURSOR_ACTIVE
    NK_COLOR_PROPERTY
    NK_COLOR_EDIT
    NK_COLOR_EDIT_CURSOR
    NK_COLOR_COMBO
    NK_COLOR_CHART
    NK_COLOR_CHART_COLOR
    NK_COLOR_CHART_COLOR_HIGHLIGHT
    NK_COLOR_SCROLLBAR
    NK_COLOR_SCROLLBAR_CURSOR
    NK_COLOR_SCROLLBAR_CURSOR_HOVER
    NK_COLOR_SCROLLBAR_CURSOR_ACTIVE
    NK_COLOR_TAB_HEADER
    NK_COLOR_KNOB
    NK_COLOR_KNOB_CURSOR
    NK_COLOR_KNOB_CURSOR_HOVER
    NK_COLOR_KNOB_CURSOR_ACTIVE
    NK_COLOR_COUNT
  end

  enum NkStyleCursor
    NK_CURSOR_ARROW
    NK_CURSOR_TEXT
    NK_CURSOR_MOVE
    NK_CURSOR_RESIZE_VERTICAL
    NK_CURSOR_RESIZE_HORIZONTAL
    NK_CURSOR_RESIZE_TOP_LEFT_DOWN_RIGHT
    NK_CURSOR_RESIZE_TOP_RIGHT_DOWN_LEFT
    NK_CURSOR_COUNT
  end

  fun nk_style_default(ctx : NkContext*)
  fun nk_style_form_table(ctx : NkContext*, table : NkColor*)
  fun nk_style_load_cursor(ctx : NkContext*, cursor : NkStyleCursor, c : NkCursor*)
  fun nk_style_load_all_cursors(ctx : NkContext*, cursors : NkCursor*)
  fun nk_style_get_color_by_name(c : NkStyleColors) : LibC::Char*
  fun nk_style_set_font(ctx : NkContext*, font : NkUserFont*)
  fun nk_style_set_cursor? = nk_style_set_cursor(ctx : NkContext*, cursor : NkStyleCursor) : NkBool
  fun nk_style_show_cursor(ctx : NkContext*)
  fun nk_style_hide_cursor(ctx : NkContext*)
  fun nk_style_push_font? = nk_style_push_font(ctx : NkContext*, font : NkUserFont*) : NkBool
  fun nk_style_push_float? = nk_style_push_float(ctx : NkContext*, style_item : LibC::Float*,
                                                 temp_value : LibC::Float) : NkBool
  fun nk_style_push_vec2? = nk_style_push_vec2(ctx : NkContext*, style_item : NkVec2*,
                                               temp_value : NkVec2) : NkBool
  fun nk_style_push_style_item? = nk_style_push_style_item(ctx : NkContext*, style_item : NkStyleItem*,
                                                           temp_value : NkStyleItem) : NkBool
  fun nk_style_push_flags? = nk_style_push_flags(ctx : NkContext*, style_item : NkFlags*,
                                                 temp_value : NkFlags) : NkBool
  fun nk_style_push_color? = nk_style_push_color(ctx : NkContext*, style_item : NkColor*,
                                                 temp_value : NkColor) : NkBool
  fun nk_style_pop_font(ctx : NkContext*)
  fun nk_style_pop_float(ctx : NkContext*)
  fun nk_style_pop_vec2(ctx : NkContext*)
  fun nk_style_pop_style_item(ctx : NkContext*)
  fun nk_style_pop_flags(ctx : NkContext*)
  fun nk_style_pop_color(ctx : NkContext*)

  # Color - line 3718
  fun nk_rgb(r : LibC::Int, g : LibC::Int, b : LibC::Int) : NkColor
  fun nk_rgb_iv(rgb : LibC::Int*) : NkColor
  fun nk_rgb_bv(rgb : NkByte*) : NkColor
  fun nk_rgb_f(r : LibC::Float, g : LibC::Float, b : LibC::Float) : NkColor
  fun nk_rgb_fv(rgb : LibC::Float*) : NkColor
  fun nk_rgb_cf(c : NkColorF) : NkColor
  fun nk_rgb_hex(rgb : LibC::Char*) : NkColor
  fun nk_rgb_factor(col : NkColor, factor : LibC::Float) : NkColor

  fun nk_rgba(r : LibC::Int, g : LibC::Int, b : LibC::Int, a : LibC::Int) : NkColor
  fun nk_rgba_u32(rgba : NkUint) : NkColor
  fun nk_rgba_iv(rgba : LibC::Int*) : NkColor
  fun nk_rgba_bv(rgba : NkByte*) : NkColor
  fun nk_rgba_f(r : LibC::Float, g : LibC::Float, b : LibC::Float, a : LibC::Float) : NkColor
  fun nk_rgba_fv(rgba : LibC::Float*) : NkColor
  fun nk_rgba_cf(c : NkColorF) : NkColor
  fun nk_rgba_hex(rgba : LibC::Char*) : NkColor

  fun nk_hsva_colorf(h : LibC::Float, s : LibC::Float, v : LibC::Float, a : LibC::Float) : NkColorF
  fun nk_hsva_colorfv(c : LibC::Float*) : NkColorF
  fun nk_colorf_hsva_f(out_h : LibC::Float*, out_s : LibC::Float*, out_v : LibC::Float, out_a : LibC::Float, in_color : NkColorF)
  fun nk_colorf_hsva_fv(hsva : LibC::Float*, in_color : NkColorF)

  fun nk_hsv(h : LibC::Int, s : LibC::Int, v : LibC::Int) : NkColor
  fun nk_hsv_iv(hsv : LibC::Int*) : NkColor
  fun nk_hsv_bv(hsv : NkByte*) : NkColor
  fun nk_hsv_f(h : LibC::Float, s : LibC::Float, v : LibC::Float) : NkColor
  fun nk_hsv_fv(hsv : LibC::Float*) : NkColor

  fun nk_hsva(h : LibC::Int, s : LibC::Int, v : LibC::Int, a : LibC::Int) : NkColor
  fun nk_hsva_iv(hsva : LibC::Int*) : NkColor
  fun nk_hsva_bv(hsva : NkByte*) : NkColor
  fun nk_hsva_f(h : LibC::Float, s : LibC::Float, v : LibC::Float, a : LibC::Float) : NkColor
  fun nk_hsva_fv(hsva : LibC::Float*) : NkColor

  # color (conversion nuklear --> user)
  fun nk_color_f(r : LibC::Float*, g : LibC::Float*, b : LibC::Float*, a : LibC::Float*, in_col : NkColor)
  fun nk_color_fv(rgba : LibC::Float*, in_col : NkColor)
  fun nk_color_cf(color : NkColor) : NkColorF

  fun nk_color_d(r : LibC::Double*, g : LibC::Double*, b : LibC::Double*, a : LibC::Double*, in_col : NkColor)
  fun nk_color_dv(rgba_out : LibC::Double*, in_col : NkColor)

  fun nk_color_u32(in_col : NkColor) : NkUint
  fun nk_color_hex_rgba(output : LibC::Char*, in_col : NkColor)
  fun nk_color_hex_rgb(output : LibC::Char*, in_col : NkColor)

  fun nk_color_hsv_i(out_h : LibC::Int*, out_s : LibC::Int*, out_v : LibC::Int*, in_col : NkColor)
  fun nk_color_hsv_b(out_h : NkByte*, out_s : NkByte*, out_v : NkByte*, in_col : NkColor)
  fun nk_color_hsv_iv(out_hsv : LibC::Int*, in_col : NkColor)
  fun nk_color_hsv_bv(out_hsv : NkByte*, in_col : NkColor)
  fun nk_color_hsv_f(out_h : LibC::Float*, out_s : LibC::Float*, out_v : LibC::Float*, in_col : NkColor)
  fun nk_color_hsv_fv(out_hsv : LibC::Float*, in_col : NkColor)

  fun nk_color_hsva_i(out_h : LibC::Int*, out_s : LibC::Int*, out_v : LibC::Int*, out_a : LibC::Int*, in_col : NkColor)
  fun nk_color_hsva_b(out_h : NkByte*, out_s : NkByte*, out_v : NkByte*, out_a : NkByte*, in_col : NkColor)
  fun nk_color_hsva_iv(out_hsva : LibC::Int*, in_col : NkColor)
  fun nk_color_hsva_bv(out_hsva : NkByte*, in_col : NkColor)
  fun nk_color_hsva_f(out_h : LibC::Float*, out_s : LibC::Float*, out_v : LibC::Float*, out_a : LibC::Float*, in_col : NkColor)
  fun nk_color_hsva_fv(out_hsva : LibC::Float*, in_col : NkColor)

  # Image - line 3782
  fun nk_handle_ptr(ptr : Void*) : NkHandle
  fun nk_handle_id(id : LibC::Int) : NkHandle
  fun nk_image_handle(handle : NkHandle) : NkImage
  fun nk_image_ptr(ptr : Void*) : NkImage
  fun nk_image_id(id : LibC::Int) : NkImage
  fun nk_image_is_subimage? = nk_image_is_subimage(img : NkImage*) : NkBool
  fun nk_subimage_ptr(ptr : Void*, w : NkUShort, h : NkUShort, sub_region : NkRect) : NkImage
  fun nk_subimage_id(id : LibC::Int, w : NkUShort, h : NkUShort, sub_region : NkRect) : NkImage
  fun nk_subimage_handle(handle : NkHandle, w : NkUShort, h : NkUShort, sub_region : NkRect) : NkImage

  # 9-Slice - line 3796
  fun nk_nine_slice_handle(handle : NkHandle, l : NkUShort, t : NkUShort, r : NkUShort, b : NkUShort) : NkNineSlice
  fun nk_nine_slice_ptr(ptr : Void*, l : NkUShort, t : NkUShort, r : NkUShort, b : NkUShort) : NkNineSlice
  fun nk_nine_slice_id(id : LibC::Int, l : NkUShort, t : NkUShort, r : NkUShort, b : NkUShort) : NkNineSlice
  fun nk_nine_slice_is_sub9slice(img : NkNineSlice*) : LibC::Int
  fun nk_sub9slice_ptr(ptr : Void*, w : NkUShort, h : NkUShort, sub_region : NkRect,
                       l : NkUShort, t : NkUShort, r : NkUShort, b : NkUShort) : NkNineSlice
  fun nk_sub9slice_id(id : LibC::Int*, w : NkUShort, h : NkUShort, sub_region : NkRect,
                      l : NkUShort, t : NkUShort, r : NkUShort, b : NkUShort) : NkNineSlice
  fun nk_sub9slice_handle(handle : NkHandle, w : NkUShort, h : NkUShort, sub_region : NkRect,
                          l : NkUShort, t : NkUShort, r : NkUShort, b : NkUShort) : NkNineSlice

  # Math - line 3808
  fun nk_murmur_hash(key : Void*, len : LibC::Int, seed : NkHash) : NkHash
  fun nk_triangle_from_direction(result : NkVec2*, r : NkRect, pad_x : LibC::Float,
                                 pad_y : LibC::Float, direction : NkHeading)

  fun nk_vec2(x : LibC::Float, y : LibC::Float) : NkVec2
  fun nk_vec2i(x : LibC::Int, y : LibC::Int) : NkVec2
  fun nk_vec2v(xy : LibC::Float*) : NkVec2
  fun nk_vec2iv(xy : LibC::Int*) : NkVec2

  fun nk_get_null_rect : NkRect
  fun nk_rect(x : LibC::Float, y : LibC::Float, w : LibC::Float, h : LibC::Float) : NkRect
  fun nk_recti(x : LibC::Int, y : LibC::Int, w : LibC::Int, h : LibC::Int) : NkRect
  fun nk_recta(pos : NkVec2, size : NkVec2) : NkRect
  fun nk_rectv(xywh : LibC::Float*) : NkRect
  fun nk_rectiv(xywh : LibC::Float*) : NkRect
  fun nk_rect_pos(rect : NkRect) : NkVec2
  fun nk_rect_size(rect : NkRect) : NkVec2

  # Font - line 3855
  struct NkUserFontGlyth
    uv : StaticArray(NkVec2, 2)
    offset : NkVec2
    width : LibC::Float
    height : LibC::Float
    xadvance : LibC::Float
  end

  # 4011
  alias NkTextWidthFCallback = (NkHandle, LibC::Float, LibC::Char*, LibC::Int -> LibC::Float)
  alias NkQueryFontGlyphFCallback = (NkHandle, LibC::Float, NkUserFontGlyth*, NkRune, NkRune -> Void)

  # 4029
  struct NkUserFont
    userdata : NkHandle
    height : LibC::Float
    width : NkTextWidthFCallback
  end

  # enum NkFontCoordType
  #   NK_COORD_UV
  #   NK_COORD_PIXEL
  # end

  # struct NkBackedFont
  #   height : LibC::Float
  #   ascent : LibC::Float
  #   descent : LibC::Float
  #   glyph_offset : NkRune
  #   glyph_count : NkRune
  #   ranges : NkRune*
  # end

  # struct NkFontConfig
  #   next : NkFontConfig*
  #   ttf_blob : Void*
  #   ttf_size : NkSize
  #   ttf_data_owned_by_atlas : LibC::UChar
  #   merge_mode : LibC::UChar
  #   pixel_snap : LibC::UChar
  #   oversample_v : LibC::UChar
  #   oversample_h : LibC::UChar
  #   padding : StaticArray(LibC::UChar, 3)
  #   size : LibC::Float
  #   coord_type : NkFontCoordType
  #   spacing : NkVec2
  #   range : NkRune*
  #   font : NkBackedFont*
  #   fallback_glyph : NkRune
  #   n : NkFontConfig*
  #   p : NkFontConfig*
  # end

  # struct NkFontGlyph
  #   codepoint : NkRune
  #   xadvance : LibC::Float
  #   x0 : LibC::Float
  #   y0 : LibC::Float
  #   x1 : LibC::Float
  #   y1 : LibC::Float
  #   w : LibC::Float
  #   h : LibC::Float
  #   u0 : LibC::Float
  #   v0 : LibC::Float
  #   u1 : LibC::Float
  #   v1 : LibC::Float
  # end

  # struct NkFont
  #   next : NkFont*
  #   handle : NkUserFont
  #   info : NkBackedFont
  #   scale : LibC::Float
  #   glyphs : NkFontGlyph*
  #   fallback : NkFontGlyph*
  #   fallback_codepoint : NkRune
  #   texture : NkHandle
  #   config : NkFontConfig
  # end

  # enum NkFontAtlasFormat
  #   NK_FONT_ATLAS_ALPHA8
  #   NK_FONT_ATLAS_RGBA32
  # end

  # struct NkFontAtlas
  #   pixel : Void*
  #   tex_width : LibC::Int
  #   tex_height : LibC::Int
  #   permanent : NkAllocator
  #   temporary : NkAllocator
  #   custom : NkRectI
  #   cursors : StaticArray(NkCursor, NkStyleCursor::NK_CURSOR_COUNT)
  #   glyph_count : LibC::Int
  #   glyphs : NkFontGlyph*
  #   default_font : NkFont*
  #   fonts : NkFont*
  #   config : NkFontConfig*
  #   font_num : LibC::Int
  # end

  # fun nk_font_default_glyph_ranges : NkRune*
  # fun nk_font_chinese_glyph_ranges : NkRune*
  # fun nk_font_cyrillic_glyph_ranges : NkRune*
  # fun nk_font_korean_glyph_ranges : NkRune*

  # fun nk_font_atlas_init_default(atlas : NkFontAtlas*)
  # fun nk_font_atlas_init(atlas : NkFontAtlas*, alloc : NkAllocator*)
  # fun nk_font_atlas_init_custom(atlas : NkFontAtlas*, persistent : NkAllocator*, transient : NkAllocator*)
  # fun nk_font_atlas_begin(atlas : NkFontAtlas*)
  # fun nk_font_config(pixel_height : LibC::Float) : NkFontConfig
  # fun nk_font_atlas_add(atlas : NkFontAtlas*, config : NkFontConfig*) : NkFont*
  # fun nk_font_atlas_add_default(atlas : NkFontAtlas*, height : LibC::Float, config : NkFontConfig*) : NkFont*
  # fun nk_font_atlas_add_from_memory(atlas : NkFontAtlas*, memory : Void*, size : NkSize, height : LibC::Float, config : NkFontConfig*) : NkFont*
  # fun nk_font_atlas_add_from_file(atlas : NkFontAtlas*, file_path : LibC::Char*, height : LibC::Float, config : NkFontConfig*) : NkFont*
  # fun nk_font_atlas_add_compressed(atlas : NkFontAtlas*, memory : Void*, size : NkSize, height : LibC::Float, config : NkFontConfig*) : NkFont*
  # fun nk_font_atlas_add_compressed_base85(atlas : NkFontAtlas*, data : LibC::Char*, height : LibC::Float, config : NkFontConfig*) : NkFont*
  # fun nk_font_atlas_bake(atlas : NkFontAtlas*, width : LibC::Int*, height : LibC::Int*, format : NkFontAtlasFormat) : Void*
  # fun nk_font_atlas_end(atlas : NkFontAtlas*, tex : NkHandle, tex_null : NkDrawNullTexture*)
  # fun nk_font_find_glyph(font : NkFont*, unicode : NkRune)
  # fun nk_font_atlas_cleanup(atlas : NkFontAtlas*)
  # fun nk_font_atlas_clear(atlas : NkFontAtlas*)

  # Memory buffer - 4174
  struct NkMemoryStatus
    memory : Void*
    type : LibC::UInt
    size : NkSize
    allocated : NkSize
    calls : NkSize
  end

  enum NkAllocationType
    NK_BUFFER_FIXED
    NK_BUFFER_DYNAMIC
  end

  enum NkBufferAllocationType
    NK_BUFFER_FRONT
    NK_BUFFER_BACK
    NK_BUFFER_MAX
  end

  struct NkBufferMarker
    active : NkBool
    offset : NkSize
  end

  struct NkMemory
    ptr : Void*
    size : NkSize
  end

  struct NkBuffer
    marker : StaticArray(NkBufferMarker, NkBufferAllocationType::NK_BUFFER_MAX)
    # buffer marker to free a buffer to a certain offset
    pool : NkAllocator
    # allocator callback for dynamic buffers
    type : NkAllocationType
    # memory management type
    memory : NkMemory
    # memory and size of the current memory block
    grow_factor : LibC::Float
    # growing factor for dynamic memory management
    allocated : NkSize
    # total amount of memory allocated
    needed : NkSize
    # totally consumed memory given that enough memory is present
    calls : NkSize
    # number of allocation calls
    size : NkSize
    # current size of the buffer
  end

  fun nk_buffer_init(b : NkBuffer*, a : NkAllocator*, size : NkSize)
  fun nk_buffer_init_fixed(b : NkBuffer*, memory : Void*, size : NkSize)
  fun nk_buffer_info(s : NkMemoryStatus*, b : NkBuffer*)
  fun nk_buffer_push(b : NkBuffer*, type : NkBufferAllocationType, memory : Void*, size : NkSize, align : NkSize)
  fun nk_buffer_mark(b : NkBuffer*, type : NkBufferAllocationType)
  fun nk_buffer_reset(b : NkBuffer*, type : NkBufferAllocationType)
  fun nk_buffer_clear(b : NkBuffer*)
  fun nk_buffer_free(b : NkBuffer*)
  fun nk_buffer_memory(b : NkBuffer*) : Void*
  fun nk_buffer_memory_const(b : NkBuffer*) : Void*
  fun nk_buffer_total(b : NkBuffer*) : NkSize

  # String 4270
  struct NkStr
    buffer : NkBuffer
    len : LibC::Int
  end

  # Text Editor - line 4326

  NK_TEXTEDIT_UNDOSTATECOUNT = 99

  NK_TEXTEDIT_UNDOCHARCOUNT = 999

  struct NkClipboard
    userdata : NkHandle
    paste : NkPluginPasteCallback
    copy : NkPluginCopyCallback
  end

  struct NkTextUndoRecord
    where : LibC::Int
    insert_length : LibC::Short
    delete_length : LibC::Short
    char_storage : LibC::Short
  end

  struct NkTextUndoState
    undo_rec : StaticArray(NkTextUndoRecord, NK_TEXTEDIT_UNDOSTATECOUNT)
    undo_char : StaticArray(NkRune, NK_TEXTEDIT_UNDOCHARCOUNT)
    undo_point : LibC::Short
    redo_point : LibC::Short
    undo_char_point : LibC::Short
    redo_char_point : LibC::Short
  end

  enum NkTextEditType
    NK_TEXT_EDIT_SINGLE_LINE
    NK_TEXT_EDIT_MULTI_LINE
  end

  enum NkTextEditMode
    NK_TEXT_EDIT_MODE_VIEW
    NK_TEXT_EDIT_MODE_INSERT
    NK_TEXT_EDIT_MODE_REPLACE
  end

  struct NkTextEdit
    clip : NkClipboard
    string : NkStr
    filter : NkPluginFilterCallback
    scrollbar : NkVec2

    cursor : LibC::Int
    select_start : LibC::Int
    select_end : LibC::Int
    mode : LibC::UChar
    cursor_at_end_of_line : LibC::UChar
    initialized : LibC::UChar
    has_preferred_x : LibC::UChar
    single_line : LibC::UChar
    active : LibC::UChar
    padding1 : LibC::UChar
    preferred_x : LibC::Float
    undo : NkTextUndoState
  end

  alias NkPluginFilterCallback = (NkTextEdit*, NkRune -> NkBool)
  alias NkPluginPasteCallback = (NkHandle, NkTextEdit* -> Void)

  # filter function
  fun nk_filter_default? = nk_filter_default(box : NkTextEdit*, unicode : NkRune) : NkBool
  fun nk_filter_ascii? = nk_filter_ascii(box : NkTextEdit*, unicode : NkRune) : NkBool
  fun nk_filter_float? = nk_filter_float(box : NkTextEdit*, unicode : NkRune) : NkBool
  fun nk_filter_decimal? = nk_filter_decimal(box : NkTextEdit*, unicode : NkRune) : NkBool
  fun nk_filter_hex? = nk_filter_hex(box : NkTextEdit*, unicode : NkRune) : NkBool
  fun nk_filter_oct? = nk_filter_oct(box : NkTextEdit*, unicode : NkRune) : NkBool
  fun nk_filter_binary? = nk_filter_binary(box : NkTextEdit*, unicode : NkRune) : NkBool

  # text editor
  fun nk_textedit_init(state : NkTextEdit*, alloc : NkAllocator*, size : NkSize)
  fun nk_textedit_init_fixed(state : NkTextEdit*, memory : Void*, size : NkSize)
  fun nk_textedit_free(state : NkTextEdit*)
  fun nk_textedit_text(state : NkTextEdit*, text : LibC::Char*, total_len : LibC::Int)
  fun nk_textedit_delete(state : NkTextEdit*, where : LibC::Int, len : LibC::Int)
  fun nk_textedit_delete_selection(state : NkTextEdit*)
  fun nk_textedit_select_all(state : NkTextEdit*)
  fun nk_textedit_cut? = nk_textedit_cut(state : NkTextEdit*)
  fun nk_textedit_paste? = nk_textedit_paste(state : NkTextEdit*, ctext : LibC::Char*, len : LibC::Int)
  fun nk_textedit_undo(state : NkTextEdit*)
  fun nk_textedit_redo(state : NkTextEdit*)

  # Drawing - line 4442
  enum NkCommandType
    NK_COMMAND_NOP
    NK_COMMAND_SCISSOR
    NK_COMMAND_LINE
    NK_COMMAND_CURVE
    NK_COMMAND_RECT
    NK_COMMAND_RECT_FILLED
    NK_COMMAND_RECT_MULTI_COLOR
    NK_COMMAND_CIRCLE
    NK_COMMAND_CIRCLE_FILLED
    NK_COMMAND_ARC
    NK_COMMAND_ARC_FILLED
    NK_COMMAND_TRIANGLE
    NK_COMMAND_TRIANGLE_FILLED
    NK_COMMAND_POLYGON
    NK_COMMAND_POLYGON_FILLED
    NK_COMMAND_POLYLINE
    NK_COMMAND_TEXT
    NK_COMMAND_IMAGE
    NK_COMMAND_CUSTOM
  end

  # command base and header of every command inside the buffer
  struct NkCommand
    type : NkCommandType
    next : NkSize
    userdata : NkHandle
  end

  # typedef void (*nk_command_custom_callback)(void *canvas, short x,short y,
  #  unsigned short w, unsigned short h, nk_handle callback_data);
  alias NkCommandCustomCallBack = (Void*, LibC::Short, LibC::Short, LibC::UShort, LibC::UShort, NkHandle) -> Void

  struct NkCommandBuffer
    base : NkBuffer*
    clip : NkRect
    use_clipping : LibC::Int
    userdata : NkHandle
    begin_field : NkSize
    end_field : NkSize
    last : NkSize
  end

  # shape outlines  - line 4690
  fun nk_stroke_line(b : NkCommandBuffer*, x0 : LibC::Float, y0 : LibC::Float, x1 : LibC::Float, y1 : LibC::Float, line_thickness : LibC::Float, color : NkColor)
  fun nk_stroke_curve(b : NkCommandBuffer*, ax : LibC::Float, ay : LibC::Float, ctrl0x : LibC::Float, ctrl0y : LibC::Float, ctrl1x : LibC::Float, ctrl1y : LibC::Float, line_thickness : LibC::Float, color : NkColor)
  fun nk_stroke_rect(b : NkCommandBuffer*, rect : NkRect, rounding : LibC::Float, line_thickness : LibC::Float, color : NkColor)
  fun nk_stroke_circle(b : NkCommandBuffer*, rect : NkRect, line_thickness : LibC::Float, color : NkColor)
  fun nk_stroke_arc(b : NkCommandBuffer*, cx : LibC::Float, cy : LibC::Float, radius : LibC::Float, a_min : LibC::Float, a_max : LibC::Float, line_thickness : LibC::Float, color : NkColor)
  fun nk_stroke_triangle(b : NkCommandBuffer*, x0 : LibC::Float, y0 : LibC::Float, x1 : LibC::Float, y1 : LibC::Float, x2 : LibC::Float, y2 : LibC::Float, line_thickness : LibC::Float, color : NkColor)
  fun nk_stroke_polyline(b : NkCommandBuffer*, points : LibC::Float*, point_count : LibC::Int, line_thickness : LibC::Float, color : NkColor)
  fun nk_stroke_polygon(b : NkCommandBuffer*, points : LibC::Float*, point_count : LibC::Int, line_thickness : LibC::Float, color : NkColor)

  # filled shades - line 4700
  fun nk_fill_rect(b : NkCommandBuffer*, rect : NkRect, rounding : LibC::Float, color : NkColor)
  fun nk_fill_rect_multi_color(b : NkCommandBuffer*, rect : NkRect, left : NkColor, top : NkColor, right : NkColor, bottom : NkColor)
  fun nk_fill_circle(b : NkCommandBuffer*, rect : NkRect, color : NkColor)
  fun nk_fill_arc(b : NkCommandBuffer*, cx : LibC::Float, cy : LibC::Float, radius : LibC::Float, a_min : LibC::Float, a_max : LibC::Float, color : NkColor)
  fun nk_fill_triangle(b : NkCommandBuffer*, x0 : LibC::Float, y0 : LibC::Float, x1 : LibC::Float, y1 : LibC::Float, x2 : LibC::Float, y2 : LibC::Float, color : NkColor)
  fun nk_fill_polygon(b : NkCommandBuffer*, points : LibC::Float*, point_count : LibC::Int, color : NkColor)

  # misc - line 4708
  fun nk_draw_image(b : NkCommandBuffer*, rect : NkRect, image : NkImage, color : NkColor)
  fun nk_draw_nine_slice(b : NkCommandBuffer*, rect : NkRect, slc : NkNineSlice, color : NkColor)
  fun nk_draw_text(b : NkCommandBuffer*, rect : NkRect, text : LibC::Char*, len : LibC::Int, font : NkUserFont*, bg : NkColor, fg : NkColor)
  fun nk_push_scissor(b : NkCommandBuffer*, rect : NkRect)
  fun nk_push_custom(b : NkCommandBuffer*, rect : NkRect, custom_command_callback : NkCommandCustomCallBack, usr : NkHandle)

  # Input 4720

  struct NkMouseButton
    down : NkBool
    clicked : LibC::UInt
    clicked_pos : NkVec2
  end

  struct NkMouse
    buttons : StaticArray(NkMouseButton, NkButtons::NK_BUTTON_MAX)
    pos : NkVec2
    prev : NkVec2
    delta : NkVec2
    scroll_delta : NkVec2
    grab : LibC::UChar
    grabbed : LibC::UChar
    ungrab : LibC::UChar
  end

  struct NkKey
    down : NkBool
    clicked : LibC::UInt
  end

  struct NkKeyboard
    keys : StaticArray(NkKey, NkKeys::NK_KEY_MAX)
    text : StaticArray(LibC::Char, NK_INPUT_MAX)
    text_len : LibC::Int
  end

  struct NkInput
    keyboard : NkKeyboard
    mouse : NkMouse
  end

  fun nk_input_has_mouse_click? = nk_input_has_mouse_click(i : NkInput*, buttons : NkButtons) : NkBool
  fun nk_input_has_mouse_click_in_rect? = nk_input_has_mouse_click_in_rect(i : NkInput*, buttons : NkButtons, rect : NkRect) : NkBool
  fun nk_input_has_mouse_click_in_button_rect? = nk_input_has_mouse_click_in_button_rect(i : NkInput*, buttons : NkButtons, rect : NkRect) : NkBool
  fun nk_input_has_mouse_click_down_in_rect? = nk_input_has_mouse_click_down_in_rect(i : NkInput*, buttons : NkButtons, rect : NkRect, down : NkBool) : NkBool
  fun nk_input_is_mouse_click_in_rect? = nk_input_is_mouse_click_in_rect(i : NkInput*, buttons : NkButtons, rect : NkRect) : NkBool
  fun nk_input_is_mouse_click_down_in_rect? = nk_input_is_mouse_click_down_in_rect(i : NkInput*, buttons : NkButtons, rect : NkRect, down : NkBool) : NkBool
  fun nk_input_any_mouse_click_in_rect? = nk_input_any_mouse_click_in_rect(i : NkInput*, rect : NkRect) : NkBool
  fun nk_input_is_mouse_prev_hovering_rect? = nk_input_is_mouse_prev_hovering_rect(i : NkInput*, rect : NkRect) : NkBool
  fun nk_input_is_mouse_hovering_rect? = nk_input_is_mouse_hovering_rect(i : NkInput*, rect : NkRect) : NkBool
  fun nk_input_mouse_clicked? = nk_input_mouse_clicked(i : NkInput*, buttons : NkButtons, rect : NkRect) : NkBool
  fun nk_input_is_mouse_down? = nk_input_is_mouse_down(i : NkInput*, buttons : NkButtons) : NkBool
  fun nk_input_is_mouse_pressed? = nk_input_is_mouse_pressed(i : NkInput*, buttons : NkButtons) : NkBool
  fun nk_input_is_mouse_released? = nk_input_is_mouse_released(i : NkInput*, buttons : NkButtons) : NkBool
  fun nk_input_is_key_pressed? = nk_input_is_key_pressed(i : NkInput*, keys : NkKeys) : NkBool
  fun nk_input_is_key_released? = nk_input_is_key_released(i : NkInput*, keys : NkKeys) : NkBool
  fun nk_input_is_key_down? = nk_input_is_key_down(i : NkInput*, keys : NkKeys) : NkBool

  # GUI - line 4926

  enum NkStyleItemType
    NK_STYLE_ITEM_COLOR
    NK_STYLE_ITEM_IMAGE
    NK_STYLE_ITEM_NINE_SLICE
  end

  union NkStyleItemData
    color : NkColor
    image : NkImage
    slice : NkNineSlice
  end

  struct NkStyleItem
    type : NkStyleItemType
    data : NkStyleItemData
  end

  struct NkStyleText
    color : NkColor
    padding : NkVec2
    color_factor : LibC::Float
    disabled_factor : LibC::Float
  end

  struct NkStyleButton
    # background
    normal : NkStyleItem
    hover : NkStyleItem
    active : NkStyleItem
    border_color : NkColor
    color_factor_background : LibC::Float

    # text
    text_background : NkColor
    text_normal : NkColor
    text_hover : NkColor
    text_active : NkColor
    text_alignment : NkFlags
    color_factor_text : LibC::Float

    # properties
    border : LibC::Float
    rounding : LibC::Float
    padding : NkVec2
    image_padding : NkVec2
    touch_padding : NkVec2
    disabled_factor : LibC::Float

    # optional user callbacks
    userdata : NkHandle
    draw_begin : (NkCommandBuffer*, NkHandle -> Void)*
    draw_end : (NkCommandBuffer*, NkHandle -> Void)*
  end

  struct NkStyleToggle
    # background
    normal : NkStyleItem
    hover : NkStyleItem
    active : NkStyleItem
    border_color : NkColor

    # cursor
    cursor_normal : NkStyleItem
    cursor_hover : NkStyleItem

    # text
    text_normal : NkColor
    text_hover : NkColor
    text_active : NkColor
    text_background : NkColor
    text_alignment : NkFlags

    # properties */
    padding : NkVec2
    touch_padding : NkVec2
    spacing : LibC::Float
    border : LibC::Float
    color_factor : LibC::Float
    disabled_factor : LibC::Float

    # optional user callbacks
    userdata : NkHandle
    draw_begin : (NkCommandBuffer*, NkHandle -> Void)*
    draw_end : (NkCommandBuffer*, NkHandle -> Void)*
  end

  struct NkStyleSelectable
    # background (inactive)
    normal : NkStyleItem
    hover : NkStyleItem
    presed : NkStyleItem

    # background (active)
    normal_active : NkStyleItem
    hover_active : NkStyleItem
    presed_active : NkStyleItem

    # text color (inactive)
    text_normal : NkColor
    text_hover : NkColor
    text_pressed : NkColor

    # text color (active)
    text_normal_active : NkColor
    text_hover_active : NkColor
    text_pressed_active : NkColor
    text_background : NkColor
    text_alignment : NkFlags

    # properties
    rounding : LibC::Float
    padding : NkVec2
    touch_padding : NkVec2
    image_padding : NkVec2
    color_factor : LibC::Float
    disabled_factor : LibC::Float

    # optional user callbacks
    userdata : NkHandle
    draw_begin : (NkCommandBuffer*, NkHandle -> Void)*
    draw_end : (NkCommandBuffer*, NkHandle -> Void)*
  end

  struct NkStyleSlider
    # background
    normal : NkStyleItem
    hover : NkStyleItem
    active : NkStyleItem
    border_color : NkColor

    # background bar
    bar_normal : NkColor
    bar_hover : NkColor
    bar_active : NkColor
    bar_filled : NkColor

    # cursor
    cursor_normal : NkStyleItem
    cursor_hover : NkStyleItem
    cursor_active : NkStyleItem

    # properties
    border : LibC::Float
    rounding : LibC::Float
    bar_height : LibC::Float
    padding : NkVec2
    spacing : NkVec2
    cursor_size : NkVec2
    color_factor : LibC::Float
    disabled_factor : LibC::Float

    # optional buttons
    show_buttons : LibC::Int
    inc_button : NkStyleButton
    dec_button : NkStyleButton
    inc_symbol : NkSymbolType
    dec_symbol : NkSymbolType

    # optional user callbacks
    userdata : NkHandle
    draw_begin : (NkCommandBuffer*, NkHandle -> Void)*
    draw_end : (NkCommandBuffer*, NkHandle -> Void)*
  end

  struct NkStyleKnob
    # background
    normal : NkStyleItem
    hover : NkStyleItem
    active : NkStyleItem
    border_color : NkColor

    # knob
    knob_normal : NkColor
    knob_hover : NkColor
    knob_active : NkColor
    knob_border_color : NkColor

    # cursor
    cursor_normal : NkColor
    cursor_hover : NkColor
    cursor_active : NkColor

    # properties
    border : LibC::Float
    knob_border : LibC::Float
    padding : NkVec2
    spacing : NkVec2
    cursor_width : LibC::Float
    color_factor : LibC::Float
    disabled_factor : LibC::Float

    # optional user callbacks
    userdata : NkHandle
    draw_begin : (NkCommandBuffer*, NkHandle -> Void)*
    draw_end : (NkCommandBuffer*, NkHandle -> Void)*
  end

  struct NkStyleProgress
    # background
    normal : NkStyleItem
    hover : NkStyleItem
    active : NkStyleItem
    border_color : NkColor

    # cursor
    cursor_normal : NkStyleItem
    cursor_hover : NkStyleItem
    cursor_active : NkStyleItem
    cursor_border_color : NkColor

    # properties
    rounding : LibC::Float
    border : LibC::Float
    cursor_border : LibC::Float
    cursor_rounding : LibC::Float
    padding : NkVec2
    color_factor : LibC::Float
    disabled_factor : LibC::Float

    # optional user callbacks
    userdata : NkHandle
    draw_begin : (NkCommandBuffer*, NkHandle -> Void)*
    draw_end : (NkCommandBuffer*, NkHandle -> Void)*
  end

  struct NkStyleScrollbar
    # background
    normal : NkStyleItem
    hover : NkStyleItem
    active : NkStyleItem
    border_color : NkColor

    # cursor
    cursor_normal : NkStyleItem
    cursor_hover : NkStyleItem
    cursor_active : NkStyleItem
    cursor_border_color : NkColor

    # properties
    border : LibC::Float
    rounding : LibC::Float
    cursor_border : LibC::Float
    cursor_rounding : LibC::Float
    padding : NkVec2
    color_factor : LibC::Float
    disabled_factor : LibC::Float

    # optional buttons
    show_buttons : LibC::Int
    inc_button : NkStyleButton
    dec_button : NkStyleButton
    inc_symbol : NkSymbolType
    dec_symbol : NkSymbolType

    # optional user callbacks
    userdata : NkHandle
    draw_begin : (NkCommandBuffer*, NkHandle -> Void)*
    draw_end : (NkCommandBuffer*, NkHandle -> Void)*
  end

  struct NkStyleEdit
    # background
    normal : NkStyleItem
    hover : NkStyleItem
    active : NkStyleItem
    border_color : NkColor
    scrollbar : NkStyleScrollbar

    # cursor
    cursor_normal : NkColor
    cursor_hover : NkColor
    cursor_text_normal : NkColor
    cursor_text_hover : NkColor

    # text (unselected)
    text_normal : NkColor
    text_hover : NkColor
    text_active : NkColor

    # text (selected)
    selected_normal : NkColor
    selected_hover : NkColor
    selected_text_normal : NkColor
    selected_text_hover : NkColor

    # properties
    border : LibC::Float
    rounding : LibC::Float
    cursor_size : LibC::Float
    scrollbar_size : NkVec2
    padding : NkVec2
    row_padding : LibC::Float
    color_factor : LibC::Float
    disabled_factor : LibC::Float
  end

  struct NkStyleProperty
    # background
    normal : NkStyleItem
    hover : NkStyleItem
    active : NkStyleItem
    border_color : NkColor

    # text
    label_normal : NkColor
    label_hover : NkColor
    label_active : NkColor

    # symbols
    sym_left : NkSymbolType
    sym_right : NkSymbolType

    # properties
    border : LibC::Float
    rounding : LibC::Float
    padding : NkVec2
    color_factor : LibC::Float
    disabled_factor : LibC::Float

    edit : NkStyleEdit
    inc_button : NkStyleButton
    dec_button : NkStyleButton

    # optional user callbacks
    userdata : NkHandle
    draw_begin : (NkCommandBuffer*, NkHandle -> Void)*
    draw_end : (NkCommandBuffer*, NkHandle -> Void)*
  end

  struct NkStyleChart
    # colors
    background : NkStyleItem
    border_color : NkColor
    selected_color : NkColor
    color : NkColor

    # properties
    border : LibC::Float
    rounding : LibC::Float
    padding : NkVec2
    color_factor : LibC::Float
    disabled_factor : LibC::Float
    show_markers : NkBool
  end

  struct NkStyleCombo
    # background
    normal : NkStyleItem
    hover : NkStyleItem
    active : NkStyleItem
    border_color : NkColor

    # label
    label_normal : NkColor
    label_hover : NkColor
    label_active : NkColor

    # symbol
    symbol_normal : NkColor
    symbol_hover : NkColor
    symbol_active : NkColor

    # button
    button : NkStyleButton
    sym_normal : NkSymbolType
    sym_hover : NkSymbolType
    sym_active : NkSymbolType

    # properties
    border : LibC::Float
    rounding : LibC::Float
    content_padding : NkVec2
    button_padding : NkVec2
    spacing : NkVec2
    color_factor : LibC::Float
    disabled_factor : LibC::Float
  end

  struct NkStyleTab
    # background
    background : NkStyleItem
    border_color : NkColor
    text : NkColor

    # button
    tab_maximize_button : NkStyleButton
    tab_minimize_button : NkStyleButton
    node_maximize_button : NkStyleButton
    node_minimize_button : NkStyleButton
    sym_minimize : NkSymbolType
    sym_maximize : NkSymbolType

    # properties
    border : LibC::Float
    rounding : LibC::Float
    indent : LibC::Float
    padding : NkVec2
    spacing : NkVec2
    color_factor : LibC::Float
    disabled_factor : LibC::Float
  end

  enum NkStyleHeaderAlign
    NK_HEADER_LEFT
    NK_HEADER_RIGHT
  end

  struct NkStyleWindowHeader
    # background
    normal : NkStyleItem
    hover : NkStyleItem
    active : NkStyleItem

    # button
    close_button : NkStyleButton
    minimize_button : NkStyleButton
    close_symbol : NkSymbolType
    minimize_symbol : NkSymbolType
    maximize_symbol : NkSymbolType

    # title
    label_normal : NkColor
    label_hover : NkColor
    label_active : NkColor

    # properties
    align : NkStyleHeaderAlign
    padding : NkVec2
    label_padding : NkVec2
    spacing : NkVec2
  end

  struct NkStyleWindow
    header : NkStyleWindowHeader
    fixed_background : NkStyleItem
    background : NkColor

    border_color : NkColor
    popup_border_color : NkColor
    combo_border_color : NkColor
    contextual_border_color : NkColor
    menu_border_color : NkColor
    group_border_color : NkColor
    tooltip_border_color : NkColor
    scaler : NkStyleItem

    border : LibC::Float
    combo_border : LibC::Float
    contextual_border : LibC::Float
    menu_border : LibC::Float
    group_border : LibC::Float
    tooltip_border : LibC::Float
    popup_border : LibC::Float
    min_row_height_padding : LibC::Float

    rounding : LibC::Float
    spacing : NkVec2
    scrollbar_size : NkVec2
    min_size : NkVec2

    padding : NkVec2
    group_padding : NkVec2
    popup_padding : NkVec2
    combo_padding : NkVec2
    contextual_padding : NkVec2
    menu_padding : NkVec2
    tooltip_padding : NkVec2
  end

  struct NkStyle
    font : NkUserFont*
    cursors : StaticArray(Pointer(NkCursor), NkStyleCursor::NK_CURSOR_COUNT)
    cursor_active : NkCursor*
    cursor_last : NkCursor*
    cursor_visible : LibC::Int

    text : NkStyleText
    button : NkStyleButton
    contextual_button : NkStyleButton
    menu_button : NkStyleButton
    option : NkStyleToggle
    checkbox : NkStyleToggle
    selectable : NkStyleSelectable
    slider : NkStyleSlider
    knob : NkStyleKnob
    progress : NkStyleProgress
    property : NkStyleProperty
    edit : NkStyleEdit
    chart : NkStyleChart
    scrollh : NkStyleScrollbar
    scrollv : NkStyleScrollbar
    tab : NkStyleTab
    combo : NkStyleCombo
    window : NkStyleWindow
  end

  fun nk_style_item_color(color : NkColor) : NkStyleItem
  fun nk_style_item_image(img : NkImage) : NkStyleItem
  fun nk_style_item_nine_slice(slice : NkNineSlice) : NkStyleItem
  fun nk_style_item_hide : NkStyleItem

  # Panel - line 5431

  NK_MAX_LAYOUT_ROW_TEMPLATE_COLUMNS = 16
  NK_CHART_MAX_SLOT                  =  4

  enum NkPanelType
    NK_PANEL_NONE       = 0
    NK_PANEL_WINDOW     = 1 << 0
    NK_PANEL_GROUP      = 1 << 1
    NK_PANEL_POPUP      = 1 << 2
    NK_PANEL_CONTEXTUAL = 1 << 4
    NK_PANEL_COMBO      = 1 << 5
    NK_PANEL_MENU       = 1 << 6
    NK_PANEL_TOOLTIP    = 1 << 7
  end

  enum NkPanelSet
    NK_PANEL_SET_NONBLOCK = NkPanelType::NK_PANEL_CONTEXTUAL | NkPanelType::NK_PANEL_COMBO | NkPanelType::NK_PANEL_MENU | NkPanelType::NK_PANEL_TOOLTIP
    NK_PANEL_SET_POPUP    = NK_PANEL_SET_NONBLOCK | NkPanelType::NK_PANEL_POPUP
    NK_PANEL_SET_SUB      = NK_PANEL_SET_POPUP | NkPanelType::NK_PANEL_GROUP
  end

  struct NkChartSlot
    type : NkChartType
    color : NkColor
    highlight : NkColor
    min : LibC::Float
    max : LibC::Float
    range : LibC::Float
    count : LibC::Int
    last : NkVec2
    index : LibC::Int
    show_markers : NkBool
  end

  struct NkChart
    slot : LibC::Int
    x : LibC::Float
    y : LibC::Float
    w : LibC::Float
    h : LibC::Float
    slots : StaticArray(NkChartSlot, NK_CHART_MAX_SLOT)
  end

  enum NkPanelRowLayoutType
    NK_LAYOUT_DYNAMIC_FIXED = 0
    NK_LAYOUT_DYNAMIC_ROW
    NK_LAYOUT_DYNAMIC_FREE
    NK_LAYOUT_DYNAMIC
    NK_LAYOUT_STATIC_FIXED
    NK_LAYOUT_STATIC_ROW
    NK_LAYOUT_STATIC_FREE
    NK_LAYOUT_STATIC
    NK_LAYOUT_TEMPLATE
    NK_LAYOUT_COUNT
  end

  struct NkRowLayout
    type : NkPanelRowLayoutType
    index : LibC::Int
    height : LibC::Float
    min_height : LibC::Float
    columns : LibC::Int
    ratio : LibC::Float*
    item_width : LibC::Float
    item_height : LibC::Float
    item_offset : LibC::Float
    filled : LibC::Float
    item : NkRect
    tree_depth : LibC::Int
    templates : StaticArray(LibC::Float, NK_MAX_LAYOUT_ROW_TEMPLATE_COLUMNS)
  end

  struct NkPopupBuffer
    begin_field : NkSize
    parent : NkSize
    last : NkSize
    end_field : NkSize
    active : NkBool
  end

  struct NkMenuState
    x : LibC::Float
    y : LibC::Float
    w : LibC::Float
    h : LibC::Float
    offset : NkScroll
  end

  struct NkPanel
    type : NkPanelType
    flags : NkFlags
    bounds : NkRect
    offset_x : NkUint*
    offset_y : NkUint*
    at_x : LibC::Float
    at_y : LibC::Float
    max_x : LibC::Float
    footer_height : LibC::Float
    header_height : LibC::Float
    border : LibC::Float
    has_scrolling : LibC::UInt
    clip : NkRect
    menu : NkMenuState
    row : NkRowLayout
    chart : NkChart
    buffer : NkCommandBuffer*
    parent : NkPanel*
  end

  # Window  5537

  NK_WINDOW_MAX_NAME = 64

  @[Flags]
  enum NkWindowFlags
    NK_WINDOW_PRIVATE = 2048
    NK_WINDOW_DYNAMIC = NK_WINDOW_PRIVATE
    # special window type growing up in height while being filled to a certain maximum height
    NK_WINDOW_ROM = 4096
    # sets window widgets into a read only mode and does not allow input changes/
    NK_WINDOW_NOT_INTERACTIVE = NK_WINDOW_ROM | NkPanelFlags::NK_WINDOW_NO_INPUT
    # prevents all interaction caused by input to either window or widgets inside
    NK_WINDOW_HIDDEN = 1 << 13
    # Hides window and stops any window interaction and drawing
    NK_WINDOW_CLOSED = 1 << 14
    # Directly closes and frees the window at the end of the frame
    NK_WINDOW_MINIMIZED = 1 << 15
    # marks the window as minimized
    NK_WINDOW_REMOVE_ROM = 1 << 16
    # Removes read only mode at the end of the window
  end

  struct NkPopupState
    win : NkWindow*
    type : NkPanelType
    buf : NkPopupBuffer
    name : NkHash
    active : NkBool
    combo_count : LibC::UInt
    con_count : LibC::UInt
    con_old : LibC::UInt
    active_con : LibC::UInt
    header : NkRect
  end

  struct NkEditState
    name : NkHash
    seq : LibC::UInt
    old : LibC::UInt
    active : LibC::Int
    prev : LibC::Int
    cursor : LibC::Int
    sel_start : LibC::Int
    sel_end : LibC::Int
    scrollbar : NkScroll
    mode : LibC::UChar
    single_line : LibC::UChar
  end

  struct NkPropertyState
    active : LibC::Int
    prev : LibC::Int
    buffer : StaticArray(LibC::Char, NK_MAX_NUMBER_BUFFER)
    length : LibC::Int
    cursor : LibC::Int
    select_start : LibC::Int
    select_end : LibC::Int
    name : NkHash
    seq : LibC::UInt
    old : LibC::UInt
    state : LibC::Int
  end

  struct NkWindow
    seq : LibC::UInt
    name : NkHash
    name_string : StaticArray(LibC::Char, NK_WINDOW_MAX_NAME)
    flags : NkFlags

    bounds : NkRect
    scrollbar : NkScroll
    buffer : NkCommandBuffer
    layout : NkPanel*
    scrollbar_hiding_timer : LibC::Float

    # persistent widget state
    property : NkPropertyState
    popup : NkPopupState
    edit : NkEditState
    scrolled : LibC::UInt
    widgets_disabled : NkBool

    tables : NkTable*
    table_count : LibC::UInt

    # window list hooks
    next : NkWindow*
    prev : NkWindow*
    parent : NkWindow*
  end

  # STACK 5626

  NK_BUTTON_BEHAVIOR_STACK_SIZE = 8

  NK_FONT_STACK_SIZE = 8

  NK_STYLE_ITEM_STACK_SIZE = 16

  NK_FLOAT_STACK_SIZE = 32

  NK_VECTOR_STACK_SIZE = 16

  NK_FLAGS_STACK_SIZE = 32

  NK_COLOR_STACK_SIZE = 32

  type NkFloat = LibC::Float

  # wygenerowane w c za pomocą makra NK_CONFIGURATION_STACK_TYPE
  struct NkConfigStackStyleItemElement
    address : NkStyleItem*
    old_value : NkStyleItem
  end

  struct NkConfigStackNkFloatElement
    address : NkFloat*
    old_value : NkFloat
  end

  struct NkConfigStackNkVec2Element
    address : NkVec2*
    old_value : NkVec2
  end

  struct NkConfigStackNkFlagsElement
    address : NkFlags*
    old_value : NkFlags
  end

  struct NkConfigStackNkColorElement
    address : NkColor*
    old_value : NkColor
  end

  struct NkConfigStackNkUserFontElement
    address : Pointer(NkUserFont*)
    old_value : NkUserFont*
  end

  struct NkConfigStackNkButtonBehaviorElement
    address : NkButtonBehavior*
    old_value : NkButtonBehavior
  end

  # Wygenerowane za pomocą makra NK_CONFIG_STACK
  struct NkConfigStackNkStyleItem
    head : LibC::Int
    elements : StaticArray(NkConfigStackStyleItemElement, NK_STYLE_ITEM_STACK_SIZE)
  end

  struct NkConfigStackNkFloat
    head : LibC::Int
    elements : StaticArray(NkConfigStackNkFloatElement, NK_FLOAT_STACK_SIZE)
  end

  struct NkConfigStackNkVec2
    head : LibC::Int
    elements : StaticArray(NkConfigStackNkVec2Element, NK_VECTOR_STACK_SIZE)
  end

  struct NkConfigStackNkFlags
    head : LibC::Int
    elements : StaticArray(NkConfigStackNkFlagsElement, NK_FLAGS_STACK_SIZE)
  end

  struct NkConfigStackNkColor
    head : LibC::Int
    elements : StaticArray(NkConfigStackNkColorElement, NK_COLOR_STACK_SIZE)
  end

  struct NkConfigStackNkUserFont
    head : LibC::Int
    elements : StaticArray(NkConfigStackNkUserFontElement, NK_FONT_STACK_SIZE)
  end

  struct NkConfigStackNkButtonBehaviour
    head : LibC::Int
    elements : StaticArray(NkConfigStackNkButtonBehaviorElement, NK_BUTTON_BEHAVIOR_STACK_SIZE)
  end

  struct NkConfigurationStacks
    style_items : NkConfigStackNkStyleItem
    floats : NkConfigStackNkFloat
    vectors : NkConfigStackNkVec2
    flags : NkConfigStackNkFlags
    colors : NkConfigStackNkColor
    fonts : NkConfigStackNkUserFont
    button_behaviors : NkConfigStackNkButtonBehaviour
  end

  # Context 5718
  # TODO sprawdzić to
  # wielkość NkWindow to 480
  # NK_VALUE_PAGE_CAPACITY = (sizeof(NkWidow) / sizeof(NkUint)) / 2
  NK_VALUE_PAGE_CAPACITY = 60

  # Wybrać największe
  # NK_VALUE_PAGE_CAPACITY = (sizeof(NkPanel) / sizeof(NkUint)) / 2

  struct NkTable
    seq : LibC::UInt
    size : LibC::UInt
    keys : StaticArray(NkHash, NK_VALUE_PAGE_CAPACITY)
    values : StaticArray(NkUint, NK_VALUE_PAGE_CAPACITY)
    next : NkTable*
    prev : NkTable*
  end

  union NkPageData
    tbl : NkTable
    pan : NkPanel
    win : NkWindow
  end

  struct NkPageElement
    data : NkPageData
    next : NkPageElement*
    prev : NkPageElement*
  end

  struct NkPage
    size : LibC::UInt
    next : NkPage*
    win : StaticArray(NkPageElement, 1)
  end

  struct NkPool
    alloc : NkAllocator
    type : NkAllocationType
    page_count : LibC::UInt
    pages : NkPage*
    freelist : NkPageElement*
    capacity : LibC::UInt
    size : NkSize
    cap : NkSize
  end

  struct NkContext
    # public: can be accessed freely
    input : NkInput
    style : NkStyle
    memory : NkBuffer
    clip : NkClipboard
    last_widget_state : NkFlags
    button_behavior : NkButtonBehavior
    stacs : NkConfigurationStacks
    delta_time_seconds : LibC::Float
    # private: should only be accessed if you know what you are doing
    userdata : NkHandle
    # text editor objects are quite big because of an internal
    # undo/redo stack. Therefore it does not make sense to have one for
    # each window for temporary use cases, so I only provide *one* instance
    # for all windows. This works because the content is cleared anyway
    text_edit : NkTextEdit
    # draw buffer used for overlay drawing operation like cursor
    overlay : NkCommandBuffer
    # windows
    build : LibC::Int
    use_pool : LibC::Int
    pool : NkPool
    begin_field : NkWindow*
    end_field : NkWindow*
    active : NkWindow*
    current : NkWindow*
    freelist : NkPageElement*
    count : LibC::UInt
    seq : LibC::UInt
  end

  # Raylib-Nuklear API - raylib-nuklear.h
  fun init_nuklear = InitNuklear(font_size : LibC::Int) : NkContext*
  # Initialize the Nuklear GUI context, with a custom font
  fun init_nuklear_ex = InitNuklearEx(font : Raylib::Font, font_size : LibC::Float) : NkContext*
  # Loads the default Nuklear font
  fun load_font_from_nuklear = LoadFontFromNuklear(font_size : LibC::Int) : Raylib::Font
  # Update the input state and internal components for Nuklear
  fun update_nuklear = UpdateNuklear(ctx : NkContext*)
  # Update the input state and internal components for Nuklear, with a custom frame time
  fun update_nuklear_ex = UpdateNuklearEx(ctx : NkContext*, delta_time : LibC::Float)
  #  Render the Nuklear GUI on the screen
  fun draw_nuklear = DrawNuklear(ctx : NkContext*)
  # Deinitialize the Nuklear context
  fun unload_nuklear = UnloadNuklear(ctx : NkContext*)
  # Convert a raylib Color to a Nuklear color object
  fun color_to_nuklear = ColorToNuklear(color : Raylib::Color) : NkColor
  # Convert a raylib Color to a Nuklear floating color
  fun color_to_nuklear_f = ColorToNuklearF(color : Raylib::Color) : NkColorF
  # Convert a Nuklear color to a raylib Color
  fun color_from_nuklear = ColorFromNuklear(color : NkColor) : Raylib::Color
  # Convert a Nuklear floating color to a raylib Color
  fun color_from_nuklear = ColorFromNuklearF(color : NkColorF) : Raylib::Color
  # Convert a Nuklear rectangle to a raylib Rectangle
  fun rectangle_from_nuklear = RectangleFromNuklear(ctx : NkContext*, rect : NkRect) : Raylib::Rectangle
  # Convert a raylib Rectangle to a Nuklear Rectangle
  fun rectangle_to_nuklear = RectangleToNuklear(ctx : NkContext*, rect : Raylib::Rectangle) : NkRect
  # Convert a raylib Texture to A Nuklear image
  fun texture_to_nuklear = TextureToNuklear(tex : Raylib::Texture) : NkImage
  # Convert a Nuklear image to a raylib Texture
  fun texture_from_nuklear = TextureFromNuklear(img : NkImage) : Raylib::Texture
  # Load a Nuklear image
  fun load_nuklear_image = LoadNuklearImage(path : LibC::Char*) : NkImage
  # Unload a Nuklear image. And free its data
  fun unload_nuklear_image = UnloadNuklearImage(img : NkImage)
  # Frees the data stored by the Nuklear image
  fun cleanup_nuklear_image = CleanupNuklearImage(img : NkImage)
  # Sets the scaling for the given Nuklear context
  fun set_nuklear_scaling(ctx : NkContext, scaling : LibC::Float)
  # Retrieves the scaling of the given Nuklear context
  fun get_nuklear_scaling = GetNuklearScaling(ctx : NkContext*) : LibC::Float
  # Internal Nuklear functions
  # NK_API float nk_raylib_font_get_text_width(nk_handle handle, float height, const char *text, int len);
  # NK_API float nk_raylib_font_get_text_width_user_font(nk_handle handle, float height, const char *text, int len);
  # NK_API void nk_raylib_clipboard_paste(nk_handle usr, struct nk_text_edit *edit);
  # NK_API void nk_raylib_clipboard_copy(nk_handle usr, const char *text, int len);
  # NK_API void* nk_raylib_malloc(nk_handle unused, void *old, nk_size size);
  # NK_API void nk_raylib_mfree(nk_handle unused, void *ptr);
  # NK_API struct nk_context* InitNuklearContext(struct nk_user_font* userFont);
  # NK_API void nk_raylib_input_keyboard(struct nk_context * ctx);
  # NK_API void nk_raylib_input_mouse(struct nk_context * ctx);
end
