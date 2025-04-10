PageExtension 50000 pageextension52193643 extends "Accounting Manager Role Center"
{
    actions
    {
        addfirst(Reporting)
        {
            action("Budget/Expenditure Report")
            {
                ApplicationArea = Basic;
                Caption = 'Budget/Expenditure Report';
                Image = "Report";
                RunObject = Report "Budget/Expenditure";
            }
        }
    }
}

