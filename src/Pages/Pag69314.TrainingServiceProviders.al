

page 69314 "Training Service Providers"
{
    CardPageID = "Training Service Provider";
    PageType = List;
    SourceTable = Vendor;
    // SourceTableView = where(Trainer = filter(true));
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Type"; Rec."Vendor Type")
                {
                    ApplicationArea = Basic;
                }
                // field("PIN Number"; Rec."PIN Number")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

