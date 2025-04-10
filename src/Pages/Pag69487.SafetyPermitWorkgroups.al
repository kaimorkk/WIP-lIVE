

page 69487 "Safety Permit Workgroups"
{
    CardPageID = "Safety Permit Workgroup";
    PageType = List;
    SourceTable = "Safety Permit Workgroup";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Workgroup Type"; Rec."Workgroup Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = Basic;
                }
                field("Telephone No."; Rec."Telephone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Date Informed"; Rec."Date Informed")
                {
                    ApplicationArea = Basic;
                }
                field("Comments/Additional Notes"; Rec."Comments/Additional Notes")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

