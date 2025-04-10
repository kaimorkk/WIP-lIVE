page 50132 "Functional Establishment Plan"
{
    Caption = 'Functional Establishment Plan';
    PageType = List;
    SourceTable = "Staff Establishment Plan";
    CardPageId = "Functional Establishment Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Duty Station"; Rec."Duty Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Duty Station field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field("Establishment Type"; Rec."Establishment Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Establishment Type field.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the External Document No. field.';
                }
            }
        }
    }
    actions
    {
        area(reporting)
        {
            action("Functional Staff Establishment")
            {
                ApplicationArea = Basic;
                Image = "Report";
                RunObject = Report "Functional Establishment Plan";
            }
            action("Staff Establishment")
            {
                ApplicationArea = Basic;
                Image = "Report";
                RunObject = Report "Staff Establishment";
            }
            action("Detailed Staff Establishment")
            {
                ApplicationArea = Basic;
                Image = "Report";
                RunObject = Report "Detailed Staff Establishment";
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Functional Staff Establishment_Promoted"; "Functional Staff Establishment")
                {
                }
                actionref("Staff Establishment_Promoted"; "Staff Establishment")
                {
                }
                actionref("Detailed Staff Establishment_Promoted"; "Detailed Staff Establishment")
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Establishment Type" := Rec."Establishment Type"::Functional;
    end;

}
