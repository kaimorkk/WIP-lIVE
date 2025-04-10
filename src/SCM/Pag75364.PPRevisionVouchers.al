page 75364 "PP Revision Vouchers"
{
    CardPageID = "PP Revision Voucher";
    DeleteAllowed = false;
    Editable = false;
    caption = 'Procurement Plan Ammendments';
    PageType = List;
    SourceTable = "Procurement Plan";
    SourceTableView = where("Document Type" = const("Revision Voucher"),
                            "Revision Voucher" = const(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(CorporateStrategicPlanID; "Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field(FinancialBudgetID; "Financial Budget ID")
                {
                    ApplicationArea = Basic;
                }
                field(FinancialYearCode; "Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field(StartDate; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate; "End Date")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control28; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control29; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control30; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control31; Links)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}

