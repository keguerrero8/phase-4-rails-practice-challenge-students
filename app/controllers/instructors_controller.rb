class InstructorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        instructors = Instructor.all
        render json: instructors, status: :ok
    end

    def show
        instructor = Instructor.find(params[:id])
        render json: instructor
    end

    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def update
        instructor = Instructor.find(params[:id])
        instructor.update(instructor_params)
        render json: instructor, status: :accepted
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def destroy
        instructor = Instructor.find(params[:id])
        instructor.destroy
    end


    private

    def instructor_params
        params.permit(:name)
    end

    def record_not_found
        render json: {error: "Record was not found"}, status: :not_found
    end

end
