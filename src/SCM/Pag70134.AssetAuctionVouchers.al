page 70134 "Asset Auction Vouchers"
{
    AdditionalSearchTerms = 'recurring sales,reorder,repeat sales';
    ApplicationArea = Suite;
    CardPageID = "Asset Auction Card";
    Editable = false;
    PageType = List;
    SourceTable = "Standard Sales Code";
    SourceTableView = where(Status = filter("Pending Approval" | Open),
                            "Method of Disposal" = const("Sale by Public Auction"));
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a code which identifies this standard sales code.';
                }
                field(Description; Description)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a description of the standard sales code.';
                }
                field(MethodofDisposal; "Method of Disposal")
                {
                    ApplicationArea = Basic;
                }
                field(DisposalType; "Disposal Type")
                {
                    ApplicationArea = Basic;
                }
                field(ExternalDocumentNo; "External Document No")
                {
                    ApplicationArea = Basic;
                }
                field(ProjectID; "Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(AssignedProcurementOfficer; "Assigned Procurement Officer")
                {
                    ApplicationArea = Basic;
                }
                field(RequestingDirectorate; "Requesting Directorate")
                {
                    ApplicationArea = Basic;
                }
                field(RequestingDepartment; "Requesting Department")
                {
                    ApplicationArea = Basic;
                }
                field(TenderName; "Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field(TenderSummary; "Tender Summary")
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyCode; "Currency Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the currency code of the amounts on the standard sales lines.';
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
    }
}

