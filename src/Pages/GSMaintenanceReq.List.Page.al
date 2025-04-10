Page 52194358 "GS Maintenance Req. List"
{
    CardPageID = "Maintenance Request Card";
    PageType = List;
    SourceTable = "User Support Incidences1";
    SourceTableView = where(Category=const(Maintenance));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(MaintenanceReference;"Incident Reference")
                {
                    ApplicationArea = Basic;
                    Caption = 'Maintenance Reference';
                }
                field(Description;"Incident Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description>';
                }
                field(MaintenanceReqDate;"Incident Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Maintenance Req. Date';
                }
                field(MaintenanceStatus;"Incident Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Maintenance Status';
                    Editable = false;
                }
                field(NoSeries;"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(Actiontaken;"Action taken")
                {
                    ApplicationArea = Basic;
                }
                field(ActionDate;"Action Date")
                {
                    ApplicationArea = Basic;
                }
                field(User;User)
                {
                    ApplicationArea = Basic;
                }
                field(SystemSupportEmailAddress;"System Support Email Address")
                {
                    ApplicationArea = Basic;
                }
                field(UseremailAddress;"User email Address")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(FileNo;"File No")
                {
                    ApplicationArea = Basic;
                }
                field(MaintenanceReqTime;"Incident Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'Maintenance Req. Time';
                }
                field(ActionTime;"Action Time")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Sent;Sent)
                {
                    ApplicationArea = Basic;
                }
                field(UserInformed;"User Informed?")
                {
                    ApplicationArea = Basic;
                }
                field(WorkplaceController;"Work place Controller")
                {
                    ApplicationArea = Basic;
                }
                field(WorkplaceControllerName;"Work place Controller Name")
                {
                    ApplicationArea = Basic;
                }
                field(IncidenceLocation;"Incidence Location")
                {
                    ApplicationArea = Basic;
                }
                field(IncidenceLocationName;"Incidence Location Name")
                {
                    ApplicationArea = Basic;
                }
                field(IncidenceOutcome;"Incidence Outcome")
                {
                    ApplicationArea = Basic;
                }
                field(IncidentOutcome;"Incident Outcome")
                {
                    ApplicationArea = Basic;
                }
                field(RemarksHR;"Remarks HR")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
          SetRange(User,UserId);
    end;
}

