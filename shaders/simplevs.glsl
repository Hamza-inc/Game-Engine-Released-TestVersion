#version 330 core
layout (location = 0) in vec3 inPosition;
layout (location = 1) in vec3 inNormal;
layout (location = 2) in vec2 inTexCoord;

uniform mat4 uMtxTransform;
uniform mat4 uMtxCamera;
uniform mat4 uMtxProjection;

out vec3 FragPos;  
out vec2 texCoord;
out vec3 normal;

void main()
{
   gl_Position = uMtxProjection*uMtxCamera*uMtxTransform*vec4(inPosition, 1.0);
   texCoord = inTexCoord;
   FragPos = vec3(uMtxTransform * vec4(inPosition, 1.0));
   normal = mat3(transpose(inverse(uMtxTransform))) * inNormal;
}

