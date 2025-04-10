page 50462 "PMMU Activities"
{
    Caption = 'PMMU Activities';
    PageType = ListPart;
    SourceTable = "PMMU Activities";
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Outcome; Rec.Outcome)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Outcome field.';
                }
                field("Strategic Objective"; Rec."Strategic Objective")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Strategic Objective field.';
                }
                field(Strategies; Rec.Strategies)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Strategies field.';
                }
                field(Perspectives; Rec.Perspectives)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Perspectives field.';
                }
                field("Strategy Output Code"; "Strategy Output Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Strategy Output Code field.', Comment = '%';
                }
                field(Outputs; Rec.Outputs)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Outputs field.', Comment = '%';
                }
                field("Output Indicators"; Rec."Output Indicators")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Output Indicators field.', Comment = '%';
                }
                field(Activities; Rec.Activities)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Activities field.';
                }
                field("Key result Areas"; Rec."Key result Areas")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Key result Areas field.';
                }
                field("Key Indicators"; Rec."Key Indicators")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Key Indicators field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Baseline Target"; Rec."Baseline Target")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Baseline Target field.';
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weight field.';
                }
                field(Target; Rec.Target)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Target field.';
                    Editable = DocumentIsAtCreation or DocumentIsAtTargetSetting;
                }

                field("Achieved Target"; Rec."Achieved Target")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Achieved Target field.';
                    Editable = DocumentIsAtEvaluation;
                }
                field(Score; Rec.Score)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Score field.';
                    Editable = DocumentIsAtEvaluation;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Output Activities")
            {
                Image = EditForecast;
                ApplicationArea = All;
                RunObject = Page "PMMU Output Activities";
                RunPageLink = "Contract No." = field("Contract No."),
                            "Entry No." = field("Entry No."),
                            "Strategy Plan ID" = field("Strategy Plan ID"),
                            "Strategy Output Code" = field("Strategy Output Code");
            }
        }

    }

    trigger OnOpenPage()
    begin
        UpdateDocumentStage();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        UpdateDocumentStage();
    end;

    trigger OnAfterGetRecord()
    begin
        UpdateDocumentStage();
    end;


    procedure UpdateDocumentStage()
    var
        SPMGenSetup: Record "SPM General Setup";
    begin
        SPMGenSetup.Get();
        DocumentIsAtEvaluation := SPMGenSetup."PMMU Document Stage" = SPMGenSetup."PMMU Document Stage"::Evaluation;
        DocumentIsAtTargetSetting := SPMGenSetup."PMMU Document Stage" = SPMGenSetup."PMMU Document Stage"::"Target Setting";
        DocumentIsAtCreation := SPMGenSetup."PMMU Document Stage" = SPMGenSetup."PMMU Document Stage"::" ";
    end;

    var
        DocumentIsAtEvaluation: Boolean;
        DocumentIsAtTargetSetting: Boolean;
        DocumentIsAtCreation: Boolean;

}
