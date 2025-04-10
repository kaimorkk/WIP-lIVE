Page 52193456 "G/L Budget Entry"
{
    PageType = ListPart;
    SourceTable = "G/L Budget Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(EntryNo; "Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field(BudgetName; "Budget Name")
                {
                    ApplicationArea = Basic;
                }
                field(GLAccountNo; "G/L Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(BusinessUnitCode; "Business Unit Code")
                {
                    ApplicationArea = Basic;
                }
                field(UserID; "User ID")
                {
                    ApplicationArea = Basic;
                }
                field(BudgetDimension1Code; "Budget Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(BudgetDimension2Code; "Budget Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(BudgetDimension3Code; "Budget Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field(BudgetDimension4Code; "Budget Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                }
                field(DimensionSetID; "Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field(BudgetType; "Budget Type")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
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

