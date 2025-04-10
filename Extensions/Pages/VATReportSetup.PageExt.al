PageExtension 52193528 pageextension52193528 extends "VAT Report Setup" 
{
    layout
    {

        //Unsupported feature: Property Deletion (ToolTipML) on ""Modify Submitted Reports"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""No. Series"(Control 7)".

        modify("VAT Return No. Series")
        {
            Visible = false;
        }
        modify("VAT Return Period No. Series")
        {
            Visible = false;
        }
        modify("Return Period")
        {
            Visible = false;
        }
        modify("Report Version")
        {
            Visible = false;
        }
        modify("Period Reminder Calculation")
        {
            Visible = false;
        }
        modify(Control16)
        {
            Visible = false;
        }
        modify("Manual Receive Period CU ID")
        {
            Visible = false;
        }
        modify("Manual Receive Period CU Cap")
        {
            Visible = false;
        }
        modify("Receive Submitted Return CU ID")
        {
            Visible = false;
        }
        modify("Receive Submitted Return CUCap")
        {
            Visible = false;
        }
        modify("Auto Update Job")
        {
            Visible = false;
        }
        modify("Update Period Job Frequency")
        {
            Visible = false;
        }
        modify("Auto Receive Period CU ID")
        {
            Visible = false;
        }
        modify("Auto Receive Period CU Cap")
        {
            Visible = false;
        }
    }
}

