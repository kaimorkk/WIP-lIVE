

page 69612 "Staff Establishment Plans"
{
    CardPageID = "Staff Establishment Plan";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Staff Establishment Plan";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(code; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Establishment Type"; Rec."Establishment Type")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Total Staff Establishment"; Rec."Total Staff Establishment")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Global Staff Establishment")
            {
                ApplicationArea = Basic;
                Image = "Report";
                // RunObject = Report "Global Staff Establishment";
            }
            action("Staff Establishment")
            {
                ApplicationArea = Basic;
                Image = "Report";
                // RunObject = Report "Staff Establishment";
            }
            action("Detailed Staff Establishment")
            {
                ApplicationArea = Basic;
                Image = "Report";
                // RunObject = Report "Detailed Staff Establishment";
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Global Staff Establishment_Promoted"; "Global Staff Establishment")
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
}

#pragma implicitwith restore

