PageExtension 52193481 pageextension52193481 extends "General Journal Batches" 
{
    Caption = 'General Journal Batches';
    actions
    {
        modify(EditJournal)
        {
            Caption = 'Edit Journal';
        }
        modify("P&osting")
        {
            Caption = 'P&osting';
        }
        
        modify(TestReport)
        {

            //Unsupported feature: Property Modification (Name) on "TestReport(Action 16)".

            Caption = 'Test Report';
        }
        modify("P&ost")
        {
            Caption = 'P&ost';
        }
        modify("Post and &Print")
        {
            Caption = 'Post and &Print';
        }
        modify("Periodic Activities")
        {
            Caption = 'Periodic Activities';
        }
        modify("Recurring General Journal")
        {
            Caption = 'Recurring General Journal';
        }
        
        modify("G/L Register")
        {
            Caption = 'G/L Register';
        }
        modify("Detail Trial Balance")
        {
            Caption = 'Detail Trial Balance';
        }
        modify("Trial Balance")
        {
            Caption = 'Trial Balance';
        }
        modify("Trial Balance by Period")
        {
            Caption = 'Trial Balance by Period';
        }
        modify(Action10)
        {
            Caption = 'G/L Register';
        }
        modify(MarkedOnOff)
        {
            Visible = false;
        }
    }
}

