PageExtension 52193644 pageextension52193644 extends "Administrator Role Center" 
{
    actions
    {
        modify("Data Privacy")
        {
            Visible = false;
        }
        modify("Page Data Classifications")
        {
            Visible = false;
        }
        modify(Classified)
        {
            Visible = false;
        }
        modify(Unclassified)
        {
            Visible = false;
        }
        modify("Page Data Subjects")
        {
            Visible = false;
        }
        modify("Page Change Log Entries")
        {
            Visible = false;
        }
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

