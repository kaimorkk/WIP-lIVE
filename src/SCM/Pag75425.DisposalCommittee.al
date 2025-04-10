page 75425 "Disposal Committee"
{
    Caption = 'Disposal Committee Appointment';
    CardPageID = "Disposal Committee Card";
    Editable = false;
    PageType = List;
    SourceTable = "IFS Tender Committee";
    SourceTableView = where(Inspection = const(false),
                            "Applicable Area" = const(Disposal));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(DocumentNo; "Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(CommitteeType; "Committee Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(AppointmentEffectiveDate; "Appointment Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field(AppointingAuthority; "Appointing Authority")
                {
                    ApplicationArea = Basic;
                }
                field(TenderName; "Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovalStatus; "Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryRegion; "Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryDirectorate; "Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryDepartment; "Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                }
                field(CreatedBy; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedDate; "Created Date")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedTime; "Created Time")
                {
                    ApplicationArea = Basic;
                }
                field(IFSCode; "IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentDate; "Document Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

