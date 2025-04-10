page 75323 "Invitation to Tender List"
{
    AdditionalSearchTerms = 'recurring sales,reorder,repeat sales';
    ApplicationArea = Suite;
    Caption = 'Invitation to Tender Notices';
    CardPageID = "Invitation to Tender Card";
    Editable = false;
    PageType = List;
    SourceTable = "Standard Sales Code";
    SourceTableView = where(Status = filter("Pending Approval" | Open));
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(Code; Code)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a code which identifies this standard sales code.';
                }
                field(Description; Description)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a description of the standard sales code.';
                }
                field("Method of Disposal"; "Method of Disposal")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Disposal Type"; "Disposal Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("External Document No"; "External Document No")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Project ID"; "Project ID")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Assigned Procurement Officer"; "Assigned Procurement Officer")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Requesting Directorate"; "Requesting Directorate")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Requesting Department"; "Requesting Department")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Tender Name"; "Tender Name")
                {
                    ApplicationArea = All;
                }
                field("Tender Summary"; "Tender Summary")
                {
                    ApplicationArea = All;
                }
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the currency code of the amounts on the standard sales lines.';
                    Visible = false;
                }
            }
        }

    }

    actions
    {
    }
}

