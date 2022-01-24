components {
  id: "camera"
  component: "/rendercam/camera.script"
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
    id: "orthoScale"
    value: "7.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "fixedAspectRatio"
    value: "true"
    type: PROPERTY_TYPE_BOOLEAN
  }
  properties {
    id: "aspectRatio"
    value: "720.0, 1280.0, 0.0"
    type: PROPERTY_TYPE_VECTOR3
  }
  properties {
    id: "useViewArea"
    value: "false"
    type: PROPERTY_TYPE_BOOLEAN
  }
  properties {
    id: "fixedArea"
    value: "false"
    type: PROPERTY_TYPE_BOOLEAN
  }
  properties {
    id: "fixedWidth"
    value: "true"
    type: PROPERTY_TYPE_BOOLEAN
  }
}
components {
  id: "camera_movement"
  component: "/assets/camera/camera_movement.script"
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
