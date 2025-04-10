Page 52194098 "Leave Family Groups"
{
    PageType = Card;
    SourceTable = "Leave Family Groups1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(FamilyGroup)
            {
                Caption = 'Family Group';
                action(Employees)
                {
                    ApplicationArea = Basic;
                    Caption = 'Employees';
                    RunObject = Page "Leave Plans-HOD";
                    RunPageLink = "Employee No"=field(Code);
                }
            }
        }
    }
}

