class BlendMode < BinData::Record
  BLEND_MODES = {
    norm: 'normal',
    dark: 'darken',
    lite: 'lighten',
    hue:  'hue',
    sat:  'saturation',
    colr: 'color',
    lum:  'luminosity',
    mul:  'multiply',
    scrn: 'screen',
    diss: 'dissolve',
    over: 'overlay',
    hLit: 'hard_light',
    sLit: 'soft_light',
    diff: 'difference',
    smud: 'exclusion',
    div:  'color_dodge',
    idiv: 'color_burn',
    lbrn: 'linear_burn',
    lddg: 'linear_dodge',
    vLit: 'vivid_light',
    lLit: 'linear_light',
    pLit: 'pin_light',
    hMix: 'hard_mix',
    pass: 'passthru',
    dkCl: 'darker_color',
    lgCl: 'lighter_color',
    fsub: 'subtract',
    fdiv: 'divide'
  }.freeze

  endian :big
  string :signature, :length => 4
  string :blend_key, :length => 4
  bit8 :opacity
  bit8 :clipping
  bit8 :flags
  bit8 :filler
end
