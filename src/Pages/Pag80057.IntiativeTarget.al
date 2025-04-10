

page 80057 "Intiative Target"
{
    PageType = List;
    SourceTable = "Intiative Target";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Workplan No."; Rec."Workplan No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan No. field.';
                }
                field("Initiative No."; Rec."Initiative No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Initiative No. field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Year Reporting Code"; Rec."Year Reporting Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Reporting Code field.';
                }
                field("Quarter Reporting Code"; Rec."Quarter Reporting Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quarter Reporting Code field.';
                }
                field("Planning Date"; Rec."Planning Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning Date field.';
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Department field.';
                }
                field("Perfomance Quantity"; Rec."Perfomance Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Perfomance Quantity field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

