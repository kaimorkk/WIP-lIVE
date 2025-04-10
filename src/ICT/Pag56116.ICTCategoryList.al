

page 56116 "ICT Category List"
{
    PageType = List;
    SourceTable = "ICT Helpdesk Category";
    UsageCategory = Administration;
    ApplicationArea = All;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Category Head"; Rec."Category Head")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Head field.';
                }
                field("Expected Duration"; Rec."Expected Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Duration field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

