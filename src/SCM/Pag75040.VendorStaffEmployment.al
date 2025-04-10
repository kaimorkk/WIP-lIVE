

page 75040 "Vendor Staff Employment"
{
    PageType = List;
    SourceTable = "Vendor Staff Employment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Staff ID"; Rec."Staff ID")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field("Previous Employer"; Rec."Previous Employer")
                {
                    ApplicationArea = Basic;
                }
                field("Title Held"; Rec."Title Held")
                {
                    ApplicationArea = Basic;
                }
                field("Start Year"; Rec."Start Year")
                {
                    ApplicationArea = Basic;
                }
                field("End Year"; Rec."End Year")
                {
                    ApplicationArea = Basic;
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = Basic;
                }
                field(Location; Rec.Location)
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

