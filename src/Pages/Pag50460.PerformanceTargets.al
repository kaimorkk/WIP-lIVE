page 50460 "Performance Targets"
{
    Caption = 'Performance Targets';
    PageType = ListPart;
    SourceTable = "Performance Targets";
    AutoSplitKey = true;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Activity; Rec.Activity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Activity field.';
                }
                field("Appraisee Objective"; Rec."Appraisee Objective")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Appraisee Objective field.', Comment = '%';
                }
                field("Performance Indicator"; Rec."Performance Indicator")
                {
                    ApplicationArea = All;
                    Caption = 'Key Performance Indicator';
                    ToolTip = 'Specifies the value of the Performance Indicator field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit of Measure field.', Comment = '%';
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weight field.';
                }
                field(Target; Target)
                {
                    ApplicationArea = all;
                    Editable = documenrt or DocumentIsAtCreation;
                    ToolTip = 'Specifies The values of the target';
                }
                field("Self Assessment Target"; Rec."Self Assessment Target")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Self Assessment Target field.', Comment = '%';
                    Editable = DocumentIsAtEvaluation and IsAppraisee;
                }
                field("Joint/Agreed Target"; Rec."Joint/Agreed Target")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Joint/Agreed Target field.', Comment = '%';
                    Editable = DocumentIsAtSuperVisor;
                }
                field(Score; Score)
                {
                    ApplicationArea = all;
                    Editable = Evalutions;
                    ToolTip = 'Specifies the activity scores';
                }
                field("Weighted Score"; Rec."Weighted Score")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weighted Score field.';
                }
                field("PAS Activity"; Rec."PAS Activity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PAS Activity field.';
                }
                field("Individual Target"; Rec."Individual Target")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Individual Target field.';
                    Visible = false;
                }

            }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        DocsEditables();

    end;

    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        DocsEditables();

    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        DocsEditables();

    end;

    local procedure DocsEditables()
    var
        PerfomanceContrHdr: Record "Perfomance Contract Header";
    begin
        SMpptset.Get();
        documenrt := (SMpptset."PAS Document Stage" = SMpptset."PAS Document Stage"::"Target Setting") and IsSuperVisor();
        Evalutions := (SMpptset."PAS Document Stage" = SMpptset."PAS Document Stage"::Evaluation) and IsSuperVisor();
        DocumentIsAtCreation := (SMpptset."PAS Document Stage" = SMpptset."PAS Document Stage");
        if PerfomanceContrHdr.Get("Contract No.") then;
        DocumentIsAtSuperVisor := PerfomanceContrHdr."Document Stage" = PerfomanceContrHdr."Document Stage"::"Sent To Supervisor";
        DocumentIsAtEvaluation := (SMpptset."PAS Document Stage" = SmPptset."PAS Document Stage"::Evaluation);
        IsAppraisee := PerfomanceContrHdr."Created By" = UserId;
    end;

    procedure IsSuperVisor() Supervisor: Boolean
    var
        PerfomanceContrHdr: Record "Perfomance Contract Header";
        Emp: Record Employee;
    begin
        if PerfomanceContrHdr.Get("Contract No.") then begin
            if Emp.Get(PerfomanceContrHdr."Responsible Employee No.") then begin
                // Supervisor := Emp.Supervisor = UserId;
            end;
        end;
    end;

    var
        documenrt: Boolean;
        Evalutions: Boolean;
        SMpptset: Record "SPM General Setup";
        DocumentIsAtCreation: Boolean;
        DocumentIsAtSuperVisor: Boolean;
        DocumentIsAtEvaluation: Boolean;
        IsAppraisee: Boolean;
}
