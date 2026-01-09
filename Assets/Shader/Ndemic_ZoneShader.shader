Shader "Ndemic/ZoneShader" {
	Properties {
		_Glow ("Glow", Range(0, 1)) = 0
		_WorldMap ("WorldMap", 2D) = "red" {}
		[Toggle(SHOWBARS)] _ShowJailBars ("ShowJailBars", Float) = 0
		_AlphaJailBars ("ShowJailBars", Range(0, 1)) = 0
		_Jailbars ("Jailbars", 2D) = "red" {}
		[Toggle(SHOWGRID)] _ShowGrid ("Show Grid", Float) = 0
		_AlphaGrid ("Alpha Grid", Range(0, 1)) = 1
		_Grid ("Grid", 2D) = "red" {}
		[Toggle(SHOWSCANNER)] _ShowScanner ("Show Scanner", Float) = 0
		[Toggle(GRAYSCALE)] _GrayScale ("GrayScale", Float) = 0
		_GrayIntensity ("GrayIntensity", Range(0, 1)) = 0
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