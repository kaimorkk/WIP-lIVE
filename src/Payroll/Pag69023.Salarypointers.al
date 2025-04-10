

page 52193894 "Salary pointers"
{
    PageType = List;
    SourceTable = "Salary Pointers";
    UsageCategory = Administration;
    SourceTableView = sorting("Salary Scale", Arrangement)
                      order(ascending);
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Arrangement; Rec.Arrangement)
                {
                    ApplicationArea = Basic;
                }
                field("Salary Pointer"; Rec."Salary Pointer")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Pay int"; Rec."Basic Pay int")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Category"; Rec."Employee Category")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000007; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000008; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000009; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000010; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

