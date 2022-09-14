unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms3D, FMX.Types3D, FMX.Forms, FMX.Graphics, 
  FMX.Dialogs, System.Math.Vectors, FMX.Controls3D, FMX.MaterialSources,
  FMX.Objects3D, FMX.Ani, FMX.Layers3D, FMX.Effects, FMX.Filter.Effects;

type
  TForm4 = class(TForm3D)
    Cube1: TCube;
    Plane1: TPlane;
    Cylinder1: TCylinder;
    LightMaterialSource1: TLightMaterialSource;
    Light1: TLight;
    Sphere1: TSphere;
    Camera1: TCamera;
    FloatAnimation1: TFloatAnimation;
    TextLayer3D1: TTextLayer3D;
    Dummy1: TDummy;
    Dummy2: TDummy;
    procedure Light1Render(Sender: TObject; Context: TContext3D);
    procedure Form3DRender(Sender: TObject; Context: TContext3D);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.Form3DRender(Sender: TObject; Context: TContext3D);
var
  S: String;
begin
  S := 'FMX.Materials.pas' + #13 +
       '3847: Context.SetShaderVariable(''EyePos'', [Context.CurrentCameraMatrix.M[3]])';
  with Context.CurrentCameraMatrix.M[3] do
    S := S + #13 + Format('Context.CurrentCameraMatrix.M[3]    = %7.3f %7.3f %7.3f %7.3f', [x, y, z, w]);
  with Context.CurrentCameraInvMatrix.M[3] do
    S := S + #13 + Format('Context.CurrentCameraInvMatrix.M[3] = %7.3f %7.3f %7.3f %7.3f', [x, y, z, w]);
  with Camera1.AbsolutePosition do
    S := S + #13 + Format('Camera1.AbsolutePosition            = %7.3f %7.3f %7.3f %7.3f', [x, y, z, w]);
  TextLayer3D1.Text := S;
end;

procedure TForm4.Light1Render(Sender: TObject; Context: TContext3D);
begin
  Context.DrawCube(TPoint3D.Zero, Light1.LocalBounds.GetSize*0.5, 1, TAlphaColorRec.Red);
end;

end.
