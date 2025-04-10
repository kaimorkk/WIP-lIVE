

page 69628 "Recruitment Work Condition"
{
    Caption = 'Recruitment Work Condition';
    PageType = List;
    SourceTable = "Recruitment Req Work Condition";
    SourceTableView = where("Document Type" = filter("Recruitment Requisition"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Working Condition Category"; Rec."Working Condition Category")
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

