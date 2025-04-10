Page 52194322 "Training Participants"
{
    PageType = ListPart;
    SourceTable = "Training Participants";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate;Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department;Department)
                {
                    ApplicationArea = Basic;
                }
                field(Designation;Designation)
                {
                    ApplicationArea = Basic;
                }
                field(NeedSource;"Need Source")
                {
                    ApplicationArea = Basic;
                }
                field(TrainingNeedDescription;"Training Need Description")
                {
                    ApplicationArea = Basic;
                }
                field(PerDiemDistribution;"Per Diem Distribution")
                {
                    ApplicationArea = Basic;
                    Caption = 'Per Diem Distribution';
                }
                field(TuitionFeeDistribution;"Tuition Fee Distribution")
                {
                    ApplicationArea = Basic;
                }
                field(AirTicketDistribution;"Air Ticket Distribution")
                {
                    ApplicationArea = Basic;
                }
                field(ImprestDistribution;"Imprest Distribution")
                {
                    ApplicationArea = Basic;
                }
                field(TravelDocumentsFeesDistribution;"Travel Docs Fees Dstrbtn")
                {
                    ApplicationArea = Basic;
                    Caption = 'Travel Documents Fees Distribution';
                }
                field(SubmittedReport;"Submitted Report")
                {
                    ApplicationArea = Basic;
                }
                field(Attendance;Attendance)
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

