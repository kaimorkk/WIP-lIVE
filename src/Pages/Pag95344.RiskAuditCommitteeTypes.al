

page 95344 "Risk & Audit Committee Types"
{
    CardPageID = "Risk & Audit Comm Types Card";
    PageType = List;
    SourceTable = "Audit Committee Types";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Committee Type"; Rec."Committee Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Title of Appointing Officer"; Rec."Title of Appointing Officer")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Non-Staff Allowed"; Rec."Non-Staff Allowed")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Min. No. of Members"; Rec."Min. No. of Members")
                {
                    ApplicationArea = Basic;
                }
                field("Mandate Type"; Rec."Mandate Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. of Appointments Made"; Rec."No. of Appointments Made")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup9)
            {
                action("Audit Committe Composition")
                {
                    ApplicationArea = Basic;
                    Image = TeamSales;
                    RunObject = Page "Risk & Audit Comm Composition";
                    RunPageLink = "Committee Type" = field("Committee Type");
                }
                action("Audit Committee Function")
                {
                    ApplicationArea = Basic;
                    Image = WorkCenterLoad;
                    RunObject = Page "Audit Committee Function";
                    RunPageLink = "Committee Type" = field("Committee Type");
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Audit Committe Composition_Promoted"; "Audit Committe Composition")
                {
                }
                actionref("Audit Committee Function_Promoted"; "Audit Committee Function")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

