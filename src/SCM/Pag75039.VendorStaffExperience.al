

page 75039 "Vendor Staff Experience"
{
    PageType = List;
    SourceTable = "Vendor Staff Experience";

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
                field("Experience Category"; Rec."Experience Category")
                {
                    ApplicationArea = Basic;
                }
                field("Experience Summary"; Rec."Experience Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment Description"; Rec."Assignment Description")
                {
                    ApplicationArea = Basic;
                }
                field("Years of Experience"; Rec."Years of Experience")
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
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

