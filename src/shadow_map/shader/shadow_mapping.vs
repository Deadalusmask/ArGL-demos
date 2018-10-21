#version 300 es

layout (location = 0) in vec3 a_position;
layout (location = 1) in vec2 a_texCoord;
layout (location = 2) in vec3 a_normal;

uniform mat4 u_model;
uniform mat4 u_view;
uniform mat4 u_projection;
uniform mat4 u_lightSpaceMatrix;

out vec2 TexCoord;
out vec3 Normal;
out vec3 WorldPos;
out vec4 FragPosLightSpace;

void main() {
    TexCoord = a_texCoord;
    Normal = a_normal;
    WorldPos = vec3(u_model * vec4(a_position, 1.0));
    FragPosLightSpace = u_lightSpaceMatrix * vec4(WorldPos, 1.0);

    gl_Position = u_projection * u_view * u_model * vec4(a_position, 1.0);
}
