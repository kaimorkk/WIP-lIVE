

page 75194 "Released Procurement Plan"
{
    CardPageID = "Procurement Plan Card";
    PageType = List;
    SourceTable = "Procurement Plan";
    SourceTableView = where("Approval Status" = const(Released));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic Plan ID"; Rec."Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Budget ID"; Rec."Financial Budget ID")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control28; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control29; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control30; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control31; Links)
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

