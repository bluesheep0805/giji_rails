class MessagesController < BasePastLogController
  expose(:potofs){ story.potofs.cache }
  expose(:events){ story.events.summary.cache }

  expose(:event){ story.events.where(turn: params[:turn]).cache.first }
  expose(:messages){ event.messages.summary.cache }

  respond_to :html, :json

  def index
    gon.messages = messages.gon
    gon.turn = event.turn
  end
end
