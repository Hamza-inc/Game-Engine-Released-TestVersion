#version 330 core
layout (location = 0) in vec3 inPosition;
layout (location = 1) in vec4 inColor;

uniform mat4 uMtxTransform;
uniform mat4 uMtxCamera;
uniform mat4 uMtxProjection;

out vec4 color;

void main()
{
   gl_Position = uMtxProjection*uMtxCamera*uMtxTransform*vec4(inPosition, 1.0);
   color = inColor;
}

