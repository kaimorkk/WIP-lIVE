Page 50054 "Request Training Participants"
{
    PageType = ListPart;
    SourceTable = "Request Training Participants";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ParticipantNo;"Employee No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Participant No';
                }
                field(ParticipantName;"Employee Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Participant Name';
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
                field(TravelDocsFeesDstrbtn;"Travel Docs Fees Dstrbtn")
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

