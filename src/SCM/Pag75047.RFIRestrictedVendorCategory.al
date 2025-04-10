

page 75047 "RFI Restricted Vendor Category"
{
    PageType = List;
    SourceTable = "RFI Restricted Vendor Category";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Prequalification Category ID"; Rec."Prequalification Category ID")
                {
                    ApplicationArea = Basic;
                }
                field("Restricted Vendor Category ID"; Rec."Restricted Vendor Category ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
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

