

page 75085 "Vendor Special Group Entry"
{
    PageType = List;
    SourceTable = "Vendor Special Group Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Certifcate No"; Rec."Certifcate No")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Category"; Rec."Vendor Category")
                {
                    ApplicationArea = Basic;
                }
                field("Certifying Agency"; Rec."Certifying Agency")
                {
                    ApplicationArea = Basic;
                }
                field("Products/Service Category"; Rec."Products/Service Category")
                {
                    ApplicationArea = Basic;
                }
                field("Certificate Expiry Date"; Rec."Certificate Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
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

