page 70142 "Asset Disposal Vouchers"
{
    AdditionalSearchTerms = 'recurring sales,reorder,repeat sales';
    ApplicationArea = Suite;
    CardPageID = "Asset Disposal Voucher Card";
    Editable = false;
    PageType = List;
    SourceTable = "Standard Sales Code";
    SourceTableView = where(Status = filter("Pending Approval" | Open),
                            "Method of Disposal" = const("Waste Disposal Management"));
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
                    ApplicationArea = All;
                }
                field("Disposal Type"; "Disposal Type")
                {
                    ApplicationArea = All;
                }
                field("External Document No"; "External Document No")
                {
                    ApplicationArea = All;
                }
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = All;
                }
                field("Assigned Procurement Officer"; "Assigned Procurement Officer")
                {
                    ApplicationArea = All;
                }
                field("Requesting Directorate"; "Requesting Directorate")
                {
                    ApplicationArea = All;
                }
                field("Requesting Department"; "Requesting Department")
                {
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

