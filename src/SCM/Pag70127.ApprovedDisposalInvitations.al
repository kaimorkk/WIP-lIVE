page 70127 "Approved Disposal Invitations"
{
    AdditionalSearchTerms = 'recurring sales,reorder,repeat sales';
    ApplicationArea = Suite;
    CardPageID = "Invitation to Tender Card";
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Standard Sales Code";
    SourceTableView = where(Status = const(Released));
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
                    Editable = false;
                    ToolTip = 'Specifies a code which identifies this standard sales code.';
                }
                field(Description; Description)
                {
                    ApplicationArea = Suite;
                    Editable = false;
                    ToolTip = 'Specifies a description of the standard sales code.';
                }
                field(MethodofDisposal; "Method of Disposal")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(DisposalType; "Disposal Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ExternalDocumentNo; "External Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ProjectID; "Project ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(AssignedProcurementOfficer; "Assigned Procurement Officer")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(RequestingDirectorate; "Requesting Directorate")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(RequestingDepartment; "Requesting Department")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(TenderName; "Tender Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TenderSummary; "Tender Summary")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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

