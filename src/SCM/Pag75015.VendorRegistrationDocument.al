

page 75015 "Vendor Registration Document"
{
    PageType = List;
    SourceTable = "Vendor Registration Document";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Global Requirement"; Rec."Global Requirement")
                {
                    ApplicationArea = Basic;
                }
                field("Special Group Requirement"; Rec."Special Group Requirement")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor (Works Requirement)"; Rec."Contractor (Works Requirement)")
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

