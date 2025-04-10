page 50468 "HR Appraisal Unit of Measure"
{
    ApplicationArea = All;
    Caption = 'HR Unit of Measure';
    PageType = List;
    SourceTable = "Unit of Measure";
    SourceTableView = where("For Appraisal?" = const(true));
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a code for the unit of measure that is shown on the item and resource cards where it is used.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a description of the unit of measure.';
                }
                field("For Appraisal?"; "For Appraisal?")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."For Appraisal?" := true;
    end;
}
