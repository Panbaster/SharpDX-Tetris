struct Vertexstructin 
{
	float4 Position : SV_Position;
	float4 Color : COLOR;
	float2 UV : TEXCOORD0;
};
struct Vertexstructout
{
	float4 Position : SV_Position;
	float4 Color : COLOR;
	float2 UV : TEXCOORD0;
};


Texture2D ShaderTexture : register(t0);
SamplerState Sampler : register(s0);
float4x4 ModelRot : register(b0);
float4 pos : register(b4);
float4x4 cameraRot : register(b5);


Vertexstructout VMain(Vertexstructin input)
{
	
	float4 pos2 = input.Position+pos;
	Vertexstructin output = (Vertexstructin)0;
	output = input;
	output.Position = pos2;

	output.Position.xy/=1+pos2.z/2;
	output.Position.z=-1/(output.Position.z/2+1)+1;
	return output;
}
float4 PMain(Vertexstructout input) : SV_Target
{
	return ShaderTexture.Sample(Sampler,input.UV);
}