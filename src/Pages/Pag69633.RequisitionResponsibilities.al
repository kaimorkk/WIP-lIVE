

page 69633 "Requisition Responsibilities"
{
    PageType = ListPart;
    Caption = 'Duties and Responsibilities/Job Dimensions';
    SourceTable = "Recruitment Req Responsibility";
    SourceTableView = where("Document Type" = filter("Recruitment Requisition"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {

                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
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

