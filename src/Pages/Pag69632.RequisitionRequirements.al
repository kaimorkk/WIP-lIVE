

page 69632 "Requisition Requirements"
{
    PageType = ListPart;
    SourceTable = "Recruitment Req Requirement";
    SourceTableView = where("Document Type" = filter("Recruitment Requisition"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type"; Rec."Requirement Type")
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

