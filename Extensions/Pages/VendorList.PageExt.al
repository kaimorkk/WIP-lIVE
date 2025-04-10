PageExtension 52193436 pageextension52193436 extends "Vendor List" 
{
    layout
    {
        
        modify("Privacy Blocked")
        {
            Visible = false;
        }
       

        //Unsupported feature: Property Deletion (SubPageLink) on "Control14(Control 14)".


        //Unsupported feature: Property Deletion (PagePartID) on "Control14(Control 14)".


        //Unsupported feature: Property Deletion (Visible) on "Control14(Control 14)".


        //Unsupported feature: Property Deletion (PartType) on "Control14(Control 14)".


        //Unsupported feature: Property Deletion (UpdatePropagation) on "Control14(Control 14)".

       
    }
    actions
    {

        //Unsupported feature: Property Modification (RunObject) on ""Statistics by C&urrencies"(Action 57)".


        //Unsupported feature: Property Modification (RunPageLink) on ""Statistics by C&urrencies"(Action 57)".

        modify("Vendor - Summary Aging")
        {
            Caption = 'Supplier - Summary Aging';

            //Unsupported feature: Property Modification (Name) on ""Vendor - Summary Aging"(Action 1905685906)".

        }
        modify("Vendor - Balance to Date")
        {
            Caption = 'Supplier - Balance to Date';

            //Unsupported feature: Property Modification (Name) on ""Vendor - Balance to Date"(Action 1904504206)".

        }
        modify("Vendor - Trial Balance")
        {
            Caption = 'Supplier - Trial Balance';

            //Unsupported feature: Property Modification (Name) on ""Vendor - Trial Balance"(Action 1906387606)".

        }
        modify("Vendor - Detail Trial Balance")
        {
            Caption = 'Supplier - Detail Trial Balance';

            //Unsupported feature: Property Modification (Name) on ""Vendor - Detail Trial Balance"(Action 1900639206)".

        }

        //Unsupported feature: Property Deletion (AccessByPermission) on ""Dimensions-&Multiple"(Action 43)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""C&ontact"(Action 56)".


        //Unsupported feature: Property Deletion (RunPageView) on ""Return Orders"(Action 63)".


        //Unsupported feature: Property Deletion (RunPageLink) on ""Return Orders"(Action 63)".

        addafter("Item Refe&rences")
        {
            action("Supplier Complaints")
            {
                ApplicationArea = Basic;
                RunObject = Page "Supplier Complaints";
                RunPageLink = "Supplier No."=field("No.");
            }
        }
        addafter(History)
        {
            group("Supplier Evaluation")
            {
                Caption = 'Supplier Evaluation';
            }
            action("Individual Evaluation")
            {
                ApplicationArea = Basic;
                Caption = 'Individual Evaluation';
                RunObject = Page "Individual Evaluation";
                RunPageLink = Vendor=field("No.");
            }
            action("Score Criteria")
            {
                ApplicationArea = Basic;
                Caption = 'Score Criteria';
                RunObject = Page "Score Criteria";
            }
            action("Score Awarding")
            {
                ApplicationArea = Basic;
                Caption = 'Score Awarding';
                RunObject = Page "Score Awarding";
                RunPageLink = Supplier=field("No.");
            }
            action("Due Diligence Information")
            {
                ApplicationArea = Basic;
                Caption = 'Due Diligence Information';
                RunObject = Page "Diligence Information";
            }
            action("Due Diligence Sheet")
            {
                ApplicationArea = Basic;
                Caption = 'Due Diligence Sheet';
                RunObject = Page "Due Delegence Sheet";
                RunPageLink = Supplier=field("No.");
            }
        }
        addafter("Vendor - Detail Trial Balance")
        {
            action("Supplier Transactions")
            {
                ApplicationArea = Basic;
                Caption = 'Supplier Transactions';
                RunObject = Report "Supplier Transactions";
            }
        }
    }
}

