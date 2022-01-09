components {
  id: "trail_maker"
  component: "/hyper_trails/trail_maker.script"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
  properties {
    id: "use_world_position"
    value: "true"
    type: PROPERTY_TYPE_BOOLEAN
  }
  properties {
    id: "trail_width"
    value: "10.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "trail_tint_color"
    value: "1.0, 1.0, 1.0, 1.0"
    type: PROPERTY_TYPE_VECTOR4
  }
  properties {
    id: "points_count"
    value: "4.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "fade_tail_alpha"
    value: "16.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "shrink_tail_width"
    value: "true"
    type: PROPERTY_TYPE_BOOLEAN
  }
  properties {
    id: "auto_update"
    value: "false"
    type: PROPERTY_TYPE_BOOLEAN
  }
}
components {
  id: "trail_satellite"
  component: "/assets/trail/trail_satellite.script"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "trail_model"
  type: "model"
  data: "mesh: \"/hyper_trails/models/trail_16.dae\"\n"
  "material: \"/hyper_trails/materials/trail.material\"\n"
  "textures: \"/hyper_trails/textures/data/texture0_6.png\"\n"
  "textures: \"/hyper_trails/textures/white.png\"\n"
  "skeleton: \"\"\n"
  "animations: \"\"\n"
  "default_animation: \"\"\n"
  "name: \"unnamed\"\n"
  ""
  position {
    x: 0.0
    y: -1.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
