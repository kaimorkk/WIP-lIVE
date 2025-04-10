page 70106 "PAS Core Values"
{
    Caption = 'PAS Core Values';
    PageType = ListPart;
    SourceTable = "PAS Core Values";
    AutoSplitKey = true;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Core Value"; Rec."Core Value")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Appraisee Comments"; Rec."Appraisee Comments")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Appraisee Comments field.', Comment = '%';
                }
                field(Score; Rec.Score)
                {
                    ApplicationArea = All;
                }
                field(Target; Rec.Target)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Target field.';
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weight field.';
                }
                field("Weighted Score"; Rec."Weighted Score")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weighted Score field.';
                }
                field("Appraisers Comments"; Rec."Appraisers Comments")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Appraisers Comments field.', Comment = '%';
                }

                field("Joint Assessment"; Rec."Joint Assessment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Joint Assessment field.', Comment = '%';
                }
                field("Key Performance Indicator"; Rec."Key Performance Indicator")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Key Performance Indicator field.', Comment = '%';
                }
                field("Self Assessment"; Rec."Self Assessment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Self Assessment field.', Comment = '%';
                }

            }
        }
    }
}
