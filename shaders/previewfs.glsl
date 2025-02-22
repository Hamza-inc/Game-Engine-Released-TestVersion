#version 330 core
 out vec4 FragColor;

 in vec2 texCoord;
 in vec3 normal;
 in vec3 FragPos;  


 struct Material {
    vec3 ambient;
    vec3 diffuse;
    vec3 specular;
    float shininess;
}; 
  
 uniform Material material;

 struct Light {
    vec3 position;
  
    vec3 ambient;
    vec3 diffuse;
    vec3 specular;
};

 uniform Light light; 


 uniform sampler2D ourTexture;
 uniform vec3 viewPos;
 uniform vec3 lightColor;


 void main()
 {
        //FragColor = texture(ourTexture,texCoord);
           if (texture(ourTexture,texCoord).w < 0.1f) discard;
            
            

            // ambient
            vec3 ambient  = light.ambient * material.ambient;
  	        
            // diffuse 
            vec3 norm = normalize(normal);
            vec3 lightDir = normalize(light.position - FragPos);
            float diff = max(dot(norm, lightDir), 0.0);
            vec3 diffuse  = light.diffuse * (diff * material.diffuse);
            

            // specular
            vec3 viewDir = normalize(viewPos - FragPos);
            vec3 reflectDir = reflect(-lightDir, norm);  
            float spec = pow(max(dot(viewDir, reflectDir), 0.0), material.shininess);
            vec3 specular = light.specular * (spec * material.specular);  
                
            vec4 result = (vec4(ambient + diffuse + specular, 1.0f)) * texture(ourTexture,texCoord);
            FragColor = result;
        
    
 }