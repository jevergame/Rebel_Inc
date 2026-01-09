Shader "Ndemic/FlowShader" {
	Properties {
		_WorldMap ("WorldMap", 2D) = "red" {}
		_WaterTex ("WaterTex", 2D) = "red" {}
		_FlowMap ("FlowMap", 2D) = "white" {}
		_BumpMap1 ("Bump Map1", 2D) = "bump" {}
		_BumpMap2 ("Bump Map2", 2D) = "bump" {}
		_WaterBlend ("Water Blend", Range(0, 1)) = 0
		_CycleTime ("Cycle Time", Float) = 10
		_FlowSpeed ("Flow speed", Float) = 0.5
		_BumpScale ("Bump Map Scale", Float) = 2
		_GrayIntensity ("GrayIntensity", Range(-1, 1)) = 0
		_DroughtIntensity ("DroughtIntensity", Range(0, 1)) = 0
		_Alpha ("Alpha", Range(0, 1)) = 1
		_Flood ("Flood Segment", Range(0, 1)) = 0
		_Tint ("Tint", Vector) = (1,1,1,1)
		_DroughtTex ("DroughtTex", 2D) = "white" {}
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType" = "Opaque" }
		LOD 200

		Pass
		{
			HLSLPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			struct Vertex_Stage_Input
			{
				float4 pos : POSITION;
			};

			struct Vertex_Stage_Output
			{
				float4 pos : SV_POSITION;
			};

			Vertex_Stage_Output vert(Vertex_Stage_Input input)
			{
				Vertex_Stage_Output output;
				output.pos = mul(unity_MatrixVP, mul(unity_ObjectToWorld, input.pos));
				return output;
			}

			float4 frag(Vertex_Stage_Output input) : SV_TARGET
			{
				return float4(1.0, 1.0, 1.0, 1.0); // RGBA
			}

			ENDHLSL
		}
	}
}