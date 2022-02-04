class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def index
        students = Student.all
        render json: students
    end

    def show
        student = Student.find(params[:id])
        render json: student, serializer: StudentSummarySerializer
    end

    def create
        student = Student.create!(student_params)
        render json: student, status: :created
    end

    def update
        student = Student.find(params[:id])
        student.update!(student_params)
        render json: student, status: :ok
    end

    private

    def student_params
        params.permit(:name, :age, :major, :instructor_id)
    end

    def record_not_found
        render json: {error: "Record not found"}, status: :not_found
    end

    def record_invalid(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
