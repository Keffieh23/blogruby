# -*- coding: utf-8 -*-
class ArticlesController < ApplicationController
before_action :authenticate_user!

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id]) #trouver l'article via son ID
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(articles_params)
    if @article.save #Sauvegarde le modèle dans la BDD
                  #+ retourne un booléen (Save ou non)
    redirect_to @article
    else
      render 'new'
    end

    #Permet d'afficher les paramètres
    #render plain: params[:article].inspect
  end
  
  def update
    @article = Article.find(params[:id])
    
    if @article.update(articles_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  def destroy
    @article=Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def articles_params
    params.require(:article).permit(:title,:text)
  end

end
