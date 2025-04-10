PageExtension 52193428 pageextension52193428 extends "Chart of Accounts" 
{
    layout
    {
        
        
        addafter("Default IC Partner G/L Acc. No")
        {
            field("Commitment Amount";"Commitment Amount")
            {
                ApplicationArea = Basic;
            }
            field("Budgeted Amount";"Budgeted Amount")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Modification (Name) on "IndentChartOfAccounts(Action 30)".


        //Unsupported feature: Property Insertion (Level) on "ActionContainer1900000006(Action 1900000006)".


        //Unsupported feature: Property Modification (Name) on ""Trial Balance"(Action 1904082706)".


        //Unsupported feature: Property Modification (RunObject) on "Action1900210206(Action 1900210206)".


        //Unsupported feature: Property Modification (Name) on "Action1900210206(Action 1900210206)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Dimensions-&Multiple"(Action 33)".


        //Unsupported feature: Property Deletion (RunPageLink) on ""G/L &Balance"(Action 132)".


        //Unsupported feature: Property Deletion (RunPageLink) on ""G/L Balance/B&udget"(Action 35)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on "IndentChartOfAccounts(Action 30)".

        modify("Periodic Activities")
        {
            Visible = false;
        }
       
        modify("Close Income Statement")
        {
            Visible = false;
        }
    }
}

